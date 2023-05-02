
import 'package:flutter/material.dart';

import '../../values/colors.dart';


class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
  title:  Text("Terminer"),
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color:ConstColors.maincolor,fontSize: 20),
  backgroundColor: Colors.white,
  shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  content:  Text("ajout réussi d'une voiture"),
);
  }
}