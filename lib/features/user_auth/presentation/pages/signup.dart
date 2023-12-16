import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pre_mart/features/user_auth/presentation/pages/home.dart';
import 'package:pre_mart/global/common/toast.dart';
import '../../firebase_auth/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';
import 'login.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  static const routeName = '/SignUp';
  TextEditingController emailController = TextEditingController();
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SignUp Page', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal:29),
        child:  Column(
          children: [
            const SizedBox(height: 40,),
            const Center(
              child: Text('SignUp', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 20,),
            // const FormContainerWidget(hintText: 'User-name', isPasswordField: false, ),
            const SizedBox(height: 20,),
            FormContainerWidget(controller: emailController ,hintText: 'Email', isPasswordField: false, ),
            const SizedBox(height: 20,),
            FormContainerWidget(controller: passwordController ,hintText: 'Password', isPasswordField: true,),
            const SizedBox(height: 20,),
            // const FormContainerWidget(hintText: 'Conform Password', isPasswordField: true,),
            const SizedBox(height: 20,),
            GestureDetector (
              onTap: (){
                _signUp();
              },
              child: Container(
                  width:double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                    child:   Text('Sign Up', style: TextStyle(color: Colors.blue),),
                  ),
                ),
            ),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have an account?'),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginPage() ));
                  },
                  child: const Text('Login', style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _signUp()  async {
    String email = emailController.text;
    String password = passwordController.text;
    // String username = usernameController.text;
    UserCredential? userCredential = await _auth.createUser(email, password);
    if (userCredential != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder:(context) => const Home() ));
      showToast(message: 'User created Successfull!');
    }
  }
}
