import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/auth_screen/login_screen/components/login_background.dart';
import 'package:first_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginBody extends StatefulWidget {
  const LoginBody({ Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenwidth/20,
            ),),
            SvgPicture.asset("assets/images/auth_images/login.svg",
            height: screenwidth/1.50,
            width: screenwidth/2,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: InputBorder.none,
                  icon: Icon(Icons.mail,
                   // color: primaryColor,
                  )
                ),
              ),),
              TextFieldContainer(
              child: TextField(
                obscureText: _hidePassword,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  // hintStyle: TextStyle(
                  //   color: Colors.white
                  // ),
                  border: InputBorder.none,
                  icon: Icon(Icons.lock,
                    //color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = ! _hidePassword;
                      });
                    } , 
                    icon: _hidePassword 
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                ),
                
              ),),
              Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, screenwidth/15, 0, screenwidth/70),
                width: screenwidth/1.80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenwidth/2),
                  child: FlatButton(
                    height: screenwidth/8,
                   // padding: EdgeInsets.symmetric(vertical: screenwidth/10),
                    color: primaryColor, 
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: TextStyle(color: primaryColor),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, screenwidth/50, 0, 9),
      padding: EdgeInsets.symmetric(horizontal: screenwidth/30 , vertical: screenwidth/500),
      width: screenwidth/1.10,
      decoration: BoxDecoration(
        // AF7AC5
        // D2B4DE
        //DFC3F5
        
        color: Color(0xFFDFC3F5),
        borderRadius: BorderRadius.circular(screenwidth/10),
      ),
      child: child,
    );
  }
}

