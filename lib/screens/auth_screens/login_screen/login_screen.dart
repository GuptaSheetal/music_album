
import 'package:flutter/material.dart';
import 'package:first_app/screens/auth_screens/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/app_logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Id',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            // Container(
            //     height: 60,
            //     padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            //     child: ElevatedButton(
            //       child: const Text(
            //         'Login',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ), 
            //       ),
            //       onPressed: () {
            //         print(emailController.text);
            //         print(passwordController.text);
            //       },
            //     )
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Row(
                children: [
                  const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder:(context) {
                        return const RegisterScreen();
                      }));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
