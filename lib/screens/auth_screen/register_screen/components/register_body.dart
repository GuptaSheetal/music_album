// ignore_for_file: prefer_const_constructors

import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/auth_screen/register_screen/components/register_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterBody extends StatefulWidget {
  RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return RegisterBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SIGNUP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenwidth/20,
            ),),
            SvgPicture.asset("assets/images/auth_images/signup.svg",
            height: screenwidth/1.70,
            width: screenwidth/2,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                   // color: primaryColor,
                  )
                ),
              ),),
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
                margin: EdgeInsets.fromLTRB(0, screenwidth/30, 0, screenwidth/100),
                height: screenwidth/10,
                width: screenwidth/2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenwidth/2),
                  child: FlatButton(
                    height: screenwidth/8,
                   // padding: EdgeInsets.symmetric(vertical: screenwidth/10),
                    color: primaryColor, 
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => HomeScreen()));
                    },
                    child: Text("Register",
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
                    "Already have an Account? ",
                    style: TextStyle(color: primaryColor),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
              Container(
                child: Row(
                  children: [
                    buildDivider(screenwidth),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenwidth/34),
                        child: Text("OR", style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    buildDivider(screenwidth)
                  ],
                ),
                height: screenwidth/10,
                width: screenwidth/1.10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(screenwidth/25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: primaryColor,
                      ),
                      //borderRadius: BorderRadius.circular(screenwidth/18)
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/images/auth_images/facebook.svg",
                    height: screenwidth/18,
                    width: screenwidth/18),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider(double screenwidth) {
    return Expanded(
      child: Divider(
      color: Colors.brown,
      height: screenwidth/100,
    ));
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
      height: screenwidth/9,
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

