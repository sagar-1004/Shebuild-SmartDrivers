import 'package:flutter/material.dart';
import 'package:smartdrivers/Screen/login_page.dart';
import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget{
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key,
    required this.showLoginPage
    }):super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _finalpasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    }
  }

  bool passwordConfirmed(){
     if(_passwordController.text.trim() == _finalpasswordController.text.trim()){
       return true;
     }else{
       return false;
     }
  }


  @override
  Widget build(BuildContext context){
    double width08 = MediaQuery.of(context).size.width * 0.065;
    double width10 = MediaQuery.of(context).size.width * 0.020;
    return Scaffold(
      appBar: Appbar(AppBarText: "Register Page", mew: 28,),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //text field
                Icon(Icons.medical_information, size: 50,),
                SizedBox(height: 20,),
                Text("Lets the Smart Driver!",
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
                // Conform password
                Padding( padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _finalpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //button
                Button(ButtonText: "Sign up", onTap: signUp, fontSize: 25),
                SizedBox(height: 10,),
                // a member? login now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("a Smart Driver?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width10*2,
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text("log in now",
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
  }
}