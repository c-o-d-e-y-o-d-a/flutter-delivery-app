import 'package:delv/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:delv/components/my_button.dart';
import 'package:delv/components/my_textfield.dart';

class registerPage extends StatefulWidget {
  final void Function()? onTap;

  registerPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<registerPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  //register method

  void register() async {
    //get auth service

    final _authService = AuthService();
    //check if password match -> create user

    if(passwordController.text == confirmPasswordController.text){

      try{
       await  _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text);
      }

      catch(e){

        showDialog(context: context,
         builder: (context) => AlertDialog(
          title: Text(
            e.toString()),
         ));
         
      }
    }

    else{
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('The passwords don\'t match'),
      ));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 25),
            Text(
              "Lets Create an Account!",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 15),
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),


            const SizedBox(height: 15),
            MyTextField(
              controller: confirmPasswordController,
              hintText: "confirm Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),


            MyButton(text: 'Sign up', onTap:  () {}),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Log In Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
