import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../controllers/authcont.dart';
import '../../values/colors.dart';
import '../screens/login_admin.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
  title: const Text("Êtes-vous sûr de vouloir vous déconnecter?"),
  titleTextStyle:const TextStyle(fontWeight: FontWeight.bold,color:ConstColors.maincolor,fontSize: 20),
  backgroundColor: Colors.white,
  shape:const  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  actionsPadding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
  actions: [ElevatedButton(
     style: ElevatedButton.styleFrom(
                primary: Colors.grey,
         ),
    onPressed: (){Navigator.of(context).pop();}, child:const Text("Annuler")),
    ElevatedButton(
        style: ElevatedButton.styleFrom(
                primary: ConstColors.maincolor,
         ),onPressed: ()async{   await Provider.of<AuthController>(context,listen: false).logout();
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  AdminScreen()));  }, child:const Text("Se déconnecter"))],
);
  }
}


 