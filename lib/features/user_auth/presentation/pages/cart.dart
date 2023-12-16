import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pre_mart/global/common/toast.dart';
import 'login.dart';

class CartMart extends StatelessWidget {
  const CartMart({super.key});

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
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
                      showToast(message: 'Logout Successfull!');
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
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>const CartMart() ));
                  }),
                ],
              )
          )
        ],
        title: const  Text('Cart page', style: TextStyle( color: Colors.black54 , fontSize: 20, fontWeight: FontWeight.bold,fontFamily: AutofillHints.familyName),),
      ),
      body: const SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width:double.infinity,
            child:  Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  SizedBox(width: 10,),
                  Text('Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(width: 40,),
                  Text('1 item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text('Rs. 100', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                ],
              ),
              ) 
            ),
          SizedBox(
            width:double.infinity,
            child:  Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 10,),
                  Text('T-Sart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(width: 40,),
                  Text('3 item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text('Rs. 260', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                ],
              ),
              ) 
            ),
        ],
      ),
      )
    );
  }
}