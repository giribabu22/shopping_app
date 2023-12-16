import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pre_mart/features/user_auth/presentation/pages/signup.dart';
import 'package:pre_mart/global/common/toast.dart';
import '../../firebase_auth/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
    TextEditingController msgController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Page', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.deepOrange,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric( horizontal:29),
        child:  Column(
          children: [
            const SizedBox(height: 70,),
            const Center(
              child: Text('', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            FormContainerWidget(controller: emailController ,hintText: 'Email', isPasswordField: false, ),
            const SizedBox(height: 20,),
            FormContainerWidget(controller: passwordController, hintText: 'Password', isPasswordField: true,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                  child: const Text('Forgot Password?', style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
            Container(
              width:double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: TextButton(
                onPressed: (){
                  _login();
                },
                child:  const Text('Login', style: TextStyle(color: Colors.blue),),
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpPage() ));
                  },
                  child: const Text('SignUp', style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }

  void _login()  async {
    String email = emailController.text;
    String password = passwordController.text;
    UserCredential? userCredent = await _auth.signInWithEmailAndPassword(email,password);
    if (userCredent != null){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder:(context) => const Home() ));
      showToast(message: 'Login Successfull');
    }

  }
}