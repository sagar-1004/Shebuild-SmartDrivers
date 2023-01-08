import 'package:flutter/material.dart';
import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
     final VoidCallback showRegisterPage;
     const LoginPage({Key? key, required this.showRegisterPage}): super(key: key);

     @override
     State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
     final _emailController = TextEditingController();
     final _passwordController = TextEditingController();

     Future signIn() async{
          await FirebaseAuth.instance.signInWithEmailAndPassword(
               email: _emailController.text.trim(),
               password: _passwordController.text.trim(),
          );
     }
  @override
  void dispose(){
          _emailController.dispose();
          _passwordController.dispose();
          super.dispose();
  }
  Widget build(BuildContext context) {
       double width08 = MediaQuery.of(context).size.width * 0.065;
       double width10 = MediaQuery.of(context).size.width * 0.020;
       return Scaffold(
            appBar: Appbar(AppBarText: "Login Page", mew: 28,),
            body: SafeArea(
            child: Center(
                 child: SingleChildScrollView(
              child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                         //text field
                        Icon(Icons.medical_information, size: 50,),
                        SizedBox(height: 20,),
                        Text("Be Smart Driver!",
                             style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width08,
                                  fontFamily: 'Roboto',
                                  letterSpacing: 1.5,

                             ),
                        ),
                        SizedBox(height: 20,),
                        //phone
                        Padding( padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: width10),
                                 decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),

                                 ),
                                 child: TextField(
                                      controller: _emailController,
                                       decoration: InputDecoration(

                                            hintText: 'email',
                                           border: OutlineInputBorder(),
                                       ),
                                 ),
                            ),
                        ),
                        SizedBox(height: 10,),
                        //password
                        Padding( padding: EdgeInsets.symmetric(horizontal: 25),
                             child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: width10),
                                  decoration: BoxDecoration(
                                       color: Colors.white,
                                       border: Border.all(color: Colors.grey),
                                       borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                       controller: _passwordController,
                                       obscureText: true,
                                       decoration: InputDecoration(
                                           border: OutlineInputBorder(),
                                           hintText: 'Password',
                                       ),
                                  ),
                             ),
                        ),
                        SizedBox(height: 10,),
                        //button
                        Button(ButtonText: "Sign in", onTap: signIn, fontSize: 25),
                        SizedBox(height: 10,),
                        //not a member? register now
                        Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                                  Text("Not a Smart Driver?",
                                  style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontSize: width10*2,
                                  ),
                                  ),
                                  SizedBox(width: width08/2),
                                  GestureDetector(
                                       onTap: widget.showRegisterPage,
                                  child: Text("Sign Up now",
                                       style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: width10*2,
                                       ),
                                  )
                                  )
                             ],
                        ),
                   ],
              ),
            ),
            ),
            ),
            backgroundColor: const Color.fromARGB(255, 226, 224, 255),
       );
    // TODO: implement build
    throw UnimplementedError();
  }

}