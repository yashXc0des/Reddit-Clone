import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/google_login_button.dart';
import 'package:reddit_clone/core/constants/constants.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Image.asset(Constants.logopath,height: 50,),
        centerTitle:true,
        actions: [
          TextButton(onPressed: () {  }, child:const Text("Skip",style: TextStyle(fontWeight:FontWeight.bold),),)
        ],

      ),
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top:40),
              child: Center(child: Text("Dive Into Anything",style: TextStyle(fontSize: 30,fontFamily: "MyFlutterApp"))),
            ),
            const SizedBox(height: 70),
            Image.asset(Constants.loginEmotepath,height: 400,),
            const SizedBox(
              height: 20,
            ),
            const GoogleSignInButton()

          ],
        ),
      )
    );
  }
}
