// ignore_for_file: prefer_const_constructors

import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/auth_screen/register_screen/components/register_background.dart';
import 'package:first_app/screens/auth_screen/register_screen/components/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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
            Text("SIGN UP",
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
                  hintStyle: TextStyle(
                    fontSize: screenwidth/25,
                    //color: Colors.white
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                  size: screenwidth/18,
                   // color: primaryColor,
                  )
                ),
              ),),
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
                            ? Icon(Icons.visibility,size: screenwidth/18,)
                            : Icon(Icons.visibility_off, size: screenwidth/18,),
                  ),
                ),
                
              ),),
              Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, screenwidth/25, 0, screenwidth/90),
                height: screenwidth/9,
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
                    style: TextStyle(color: primaryColor,fontSize: screenwidth/30),
                  ),
                  Text(
                    "Login",
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
                  SocialIcons(screenwidth: screenwidth, 
                    iconSrc: ("assets/images/auth_images/facebook.png"),
                    onPress: () { },
                  ),
                  SocialIcons(screenwidth: screenwidth, 
                    iconSrc: ("assets/images/auth_images/google_plus.png"), 
                    onPress: () { },
                  ),
                  SocialIcons(screenwidth: screenwidth, 
                    iconSrc: ("assets/images/auth_images/twitter.png"), 
                    onPress: () { },
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

