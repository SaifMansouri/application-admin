import 'package:applicationahiit_admin/views/Widgets/paragraphinput.dart';
import 'package:applicationahiit_admin/views/screens/add_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


import '../../controllers/signcontroller.dart';
import '../../values/colors.dart';
import '../Widgets/botoun.dart';
import '../Widgets/input.dart';


class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset('assets/logo1.png',height: 60,),
                  const SizedBox(height: 20,),
                  const Text(style: TextStyle(
                    color:ConstColors.maincolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily:'Roboto',
                  ),"Bienvenue Admin"),
                  const SizedBox(height: 8,),
            
                const Text(style: TextStyle(
                    color: ConstColors.maincolor,
                    fontFamily:'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,         
                  ),"S'identifier"),
                  const SizedBox(height: 15,),
                  const InputText(hint: "Adresse E-mail",type: TextInputType.emailAddress,),
                  const SizedBox(height: 15,),
                  InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Provider.of<SigninController>(context).icon,click: () => Provider.of<SigninController>(context,listen: false).visibilite(),),    
                  const SizedBox(height: 15,),
                  MyBottoun(text: 'connecter',click: () async{ 
                    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "yassine@gmail.com",
    password: "12345678",
  );
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AddScreen()));
                       print('logged in');

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

                  },),
          ],),
        )
        ),
      ),
    );
  }
}