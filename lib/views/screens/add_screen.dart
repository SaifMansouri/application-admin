import 'package:applicationahiit_admin/controllers/addcontroller.dart';
import 'package:applicationahiit_admin/views/Widgets/botoun.dart';
import 'package:applicationahiit_admin/views/Widgets/dialog.dart';
import 'package:applicationahiit_admin/views/Widgets/input.dart';
import 'package:applicationahiit_admin/views/Widgets/paragraphinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
              Center(child: ClipRRect(borderRadius: BorderRadius.circular(30), child: InkWell(
                onTap: () async=>await Provider.of<AddController>(context,listen:false).getimage() ,
                child: Provider.of<AddController>(context).f!=null? 
                Image.file(Provider.of<AddController>(context).f! ,height: MediaQuery.of(context).size.height*0.45,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,):Image.asset('assets/imageholder.png',height: MediaQuery.of(context).size.height*0.45,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)))),
              const SizedBox(height: 20,),
              const InputText(hint: 'Nom du modèle de la voiture'),
              const SizedBox(height: 10,),
              const InputText(hint: 'Matricule de voiture de la client'),
              const SizedBox(height: 10,),
              const InputParagraph(hint: 'Description et informations sur la voiture...'),
              const SizedBox(height: 20,),
              MyBottoun(text: 'Confirmer', click: (){showDialog(context: context, builder: (context) => MyDialog(), );}),
              
              
            ]),
          ),
        ),
      ),
    ));
  }
}