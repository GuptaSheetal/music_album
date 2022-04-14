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
                  hintStyle: TextStyle(
                    fontSize: screenwidth/25,
                    //color: Colors.white
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.mail,
                  size: screenwidth/18,
                   // color: primaryColor,
                  )
                ),
              ),),
              TextFieldContainer(
              child: TextField(
                obscureText: _hidePassword,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    fontSize: screenwidth/25,
                    //color: Colors.white
                  ),
                  // hintStyle: TextStyle(
                  //   color: Colors.white
                  // ),
                  border: InputBorder.none,
                  icon: Icon(Icons.lock,
                  size: screenwidth/18,
                    //color: primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = ! _hidePassword;
                      });
                    } , 
                    icon: _hidePassword 
                            ? Icon(Icons.visibility, size: screenwidth/18,)
                            : Icon(Icons.visibility_off, size: screenwidth/18,)),
                ),
                
              ),),
              Container(
                margin: EdgeInsets.fromLTRB(0, screenwidth/80, screenwidth/40, 0),
                alignment: Alignment.centerRight,
                child: Text("Forget Password?",
                //textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: screenwidth/25,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),),
              ),
              Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, screenwidth/15, 0, screenwidth/70),
                height: screenwidth/9,
                width: screenwidth/2,
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
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: screenwidth/30
                      ),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontStyle: FontStyle.italic,
                      fontSize: screenwidth/30,
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
      margin: EdgeInsets.fromLTRB(0, screenwidth/50, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: screenwidth/30 ),
      width: screenwidth/1.10,
      height: screenwidth/8,
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

