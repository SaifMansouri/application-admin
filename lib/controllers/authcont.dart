import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier{
Future<void> login(String email ,String password)async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print("Aucun utilisateur n'a été trouvé pour cet e-mail.");
  } else if (e.code == 'wrong-password') {
    print('Mauvais mot de passe fourni pour cet utilisateur.');
  }
}
}
}