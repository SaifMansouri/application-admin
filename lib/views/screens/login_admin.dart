import 'package:applicationahiit_admin/views/Widgets/paragraphinput.dart';
import 'package:applicationahiit_admin/views/screens/add_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


import '../../controllers/authcont.dart';
import '../../controllers/signcontroller.dart';
import '../../values/colors.dart';
import '../Widgets/botoun.dart';
import '../Widgets/input.dart';


class AdminScreen extends StatelessWidget {
   AdminScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                backgroundColor: Colors.white,

        body: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Form(
            key: _formKey,
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
                     InputText(hint: "Adresse E-mail",type: TextInputType.emailAddress,validator: (val)=>Provider.of<AuthController>(context,listen: false).validEmail(val??""),controler: myController1,),
                    const SizedBox(height: 15,),
                    InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Provider.of<SigninController>(context).icon,click: () => Provider.of<SigninController>(context,listen: false).visibilite(),validator: (val)=>Provider.of<AuthController>(context,listen: false).validPassword(val??""),controler: myController2,),    
                    const SizedBox(height: 15,),
                    MyBottoun(text: 'connecter',click: () async{ 
                      if(!_formKey.currentState!.validate()){
                        return;
                      }                      _formKey.currentState!.save();

                    await Provider.of<AuthController>(context,listen: false).login(myController1.text, myController2.text, context);
                    },),
            ],),
          ),
        )
        ),
      ),
    );
  }
}