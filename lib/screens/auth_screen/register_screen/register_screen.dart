import 'package:first_app/screens/auth_screen/login_screen/components/login_body.dart';
import 'package:first_app/screens/auth_screen/register_screen/components/register_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RegisterBody(),
    );
  }
}