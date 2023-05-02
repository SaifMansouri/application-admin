import 'dart:async';
import 'package:applicationahiit_admin/views/screens/add_screen.dart';
import 'package:applicationahiit_admin/views/screens/login_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{
  @override
 void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
FirebaseAuth.instance
  .userChanges()
  .listen((User? user) {
    if (user == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>  AdminScreen()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>  AddScreen()));
    }
  });

  });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ConstColors.maincolor,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 20,),
          Image.asset('assets/logo.png',height: 100,),
          const SizedBox(height: 30,),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          
          
          ),
          const SizedBox(height: 20,),
          const Text("Chargement",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)
          
          
        ],
        ),
      ),
      

    );
  }
}
