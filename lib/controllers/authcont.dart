import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../views/screens/add_screen.dart';

class AuthController with ChangeNotifier{
  String error="une erreur s'est produite";


//log into firabase with email and password  
Future<void> login(String email,String password,BuildContext ctx)async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) =>  AddScreen()));                   
    print('logged in');
 } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    error='Aucun utilisateur trouvé pour cet e-mail.';
  } else if (e.code == 'wrong-password') {
    error='Mauvais mot de passe fourni pour cet utilisateur.';
  }

Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
} }

//log out from firebase
Future<void> logout()async{
  await FirebaseAuth.instance.signOut();
  
}


//email validator
String ?validEmail(String v){
  if (!v.contains("@gmail.com")||v.isEmpty) 
                    return "email n'est pas valide";
}
//email validator
String ?validPassword(String v){
  if (v.length<8||v.isEmpty) 
                    return 'longeur minimale:8';
}

}