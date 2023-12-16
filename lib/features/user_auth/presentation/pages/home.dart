import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pre_mart/global/common/toast.dart';
import '../widgets/prodect_widget.dart';
import 'dart:async';
import 'cart.dart';
import 'login.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home>{
  late Future<List<dynamic>?> items;

  Future<List<dynamic>?> gettingData() async {
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      print('connectivityResult');
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        const url = "https://fakestoreapi.com/products";      
        final response = await  http.get(Uri.parse(url));
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw 'Network error ' ;
      }
    } catch (e) {
      return throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    items = gettingData();
  }
  @override
  Widget build(BuildContext content){
    return   Scaffold(
      appBar: AppBar(
        // title: const Text('Home Page', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.deepOrange,
        actions: [
          Card(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => const LoginPage() ), (route)=> false);
                  showToast(message: 'Logout Successfull');
                },
              ),
              const SizedBox(
                width: 140,
                child:  TextField(
                  decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(icon: const Icon(Icons.shopping_cart), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => CartMart() ));
              }),
            ],
          )
        )
        ],
        title: const  Text('PRE-MATE', style: TextStyle( color: Colors.black54 , fontSize: 20, fontWeight: FontWeight.bold,fontFamily: AutofillHints.familyName),),
      ),
      body: FutureBuilder(
        future: items, 
        builder: ( context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          if (snapshot.hasError) {
            return  Center(child: Text(snapshot.error.toString()));
          }
          return SingleChildScrollView(
          child:  Center(
            child: Padding(
              padding: const EdgeInsets.all(16.7),
              child: Column( 
                children: [

                  const Text('Welcome to Pre-mart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const Text('We have the best products for you', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(
                  child: Column(
                    children: <Widget> [
                      for (var item in snapshot.data!)
                        Product(title: item['title'], img_url: item['image'], price: item['price'].toString(), dec: item['description'], id: item['id'].toString(), rating: item['rating']),
                    ]
                  )
                )
                  
                ]
              ),
            ),
          ),
        );
        }
      ),
    );
  }
}