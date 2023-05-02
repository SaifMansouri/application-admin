import 'package:applicationahiit_admin/controllers/addcontroller.dart';
import 'package:applicationahiit_admin/controllers/authcont.dart';
import 'package:applicationahiit_admin/values/colors.dart';
import 'package:applicationahiit_admin/views/Widgets/botoun.dart';
import 'package:applicationahiit_admin/views/Widgets/dialog.dart';
import 'package:applicationahiit_admin/views/Widgets/input.dart';
import 'package:applicationahiit_admin/views/Widgets/logout_dialog.dart';
import 'package:applicationahiit_admin/views/Widgets/paragraphinput.dart';
import 'package:applicationahiit_admin/views/screens/login_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../models/car_model.dart';

class AddScreen extends StatelessWidget {
   TextEditingController model =TextEditingController();
     TextEditingController id =TextEditingController();
   TextEditingController matricule=TextEditingController();
   TextEditingController desc =TextEditingController();
  final _formKey = GlobalKey<FormState>();

   AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<AddController>(context,listen: false);

    return SafeArea(child: Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [IconButton(onPressed: ()async{
            showDialog(context: context, builder: (ctx)=>const LogoutDialog());
          }, icon:const Icon(Icons.logout,color: ConstColors.maincolor,))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                
                Center(child: ClipRRect(borderRadius: BorderRadius.circular(30), child: InkWell(
                  onTap: () async=>await Provider.of<AddController>(context,listen:false).getimage() ,
                  child: Provider.of<AddController>(context).f!=null? 
                  Image.file(Provider.of<AddController>(context).f! ,height: MediaQuery.of(context).size.height*0.45,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,):Image.asset('assets/imageholder.png',height: MediaQuery.of(context).size.height*0.45,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)))),
                const SizedBox(height: 20,),
                 InputText(hint: 'Nom du modèle de la voiture',controler: model,validator: (v)=>provider.validModel(v??"")),
                const SizedBox(height: 10,),
                 InputText(hint: 'Matricule de voiture de la client',controler: matricule,validator: (v)=>provider.validMatricule(v??"")),
                const SizedBox(height: 10,),
                  InputText(hint: "L'ID de voiture de la client",controler: id,validator: (v)=>provider.validId(v??"")),
                const SizedBox(height: 10,),
                 InputParagraph(hint: 'Description et informations sur la voiture...',controler: desc,validator: (v)=>provider.validDesc(v??"")),
                const SizedBox(height: 20,),
                MyBottoun(text: 'Confirmer', click: ()async{
                    if(_formKey.currentState!.validate()){
                        }                      _formKey.currentState!.save();
                  await Provider.of<AddController>(context,listen: false).addNewCar( Car(rNumber: matricule.text,model: model.text,description: desc.text,image: provider.fileName,id: id.text), context);
                }),
                
                
              ]),
            ),
          ),
        ),
      ),
    ));
  }
}