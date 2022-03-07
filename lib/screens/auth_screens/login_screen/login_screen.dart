
import 'package:flutter/material.dart';
import 'package:first_app/screens/auth_screens/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/app_logo.png"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0,4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenwidth/3.312)
                ),
                   width: screenwidth / 3.312,
                  height: screenwidth / 3.312,
                ),
                SizedBox(
                  height: screenwidth / 20.7,
                ),
                Text(
                  "User Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: screenwidth / 20.7,
                      fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenwidth / 5.83
                 ),
                Container(               
                  margin: EdgeInsets.symmetric(horizontal: screenwidth/12.54),
                  child: const TextField(            
                    decoration: InputDecoration(                      
                      labelText: "Enter Email",
                      prefixIcon: Icon(Icons.email)
                    ),
                    //controller: emailController,
                  ),
                ),
                SizedBox(
                  height: screenwidth / 18,
                 ),
                Container(               
                  margin: EdgeInsets.symmetric(horizontal: screenwidth/12.54),
                  child: TextField(    
                    obscureText: _hidePassword,        
                    decoration: InputDecoration(                      
                      labelText: "Enter Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      }, 
                      icon: _hidePassword
                          ? const Icon(Icons.visibility) 
                          : const Icon(Icons.visibility_off)),
                    prefixIcon: const Icon(Icons.lock)),
                    //controller: passwordController,
                  ),
                ),
                SizedBox(height: screenwidth / 9.63),
                Container(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      screenwidth / 10.35)))),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth / 20.7),
                      )),
                  width: screenwidth / 2.36,
                  height: screenwidth / 8.28,
                ),
               ],
            ),
          ),
        ),
         backgroundColor: Colors.white,
    );
  }
}