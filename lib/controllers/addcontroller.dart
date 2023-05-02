import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:applicationahiit_admin/views/Widgets/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image_picker/image_picker.dart';

import '../models/car_model.dart';

class AddController with ChangeNotifier{
  XFile ? img=null;
  File ? f ;
  final ImagePicker _picker = ImagePicker();
   List<Car> allCars=[];
  CollectionReference cars = FirebaseFirestore.instance.collection('cars');
  String fileName="";
  
  Future  getimage() async{
  img = await _picker.pickImage(source: ImageSource.gallery);
  if (img!= null)
  f = File (img!.path);
  fileName=basename(f!.path);
  notifyListeners();
  }
  
  Future<void> addNewCar(Car car,BuildContext ctx)async{
await getAllCars();

for(Car c in allCars){
  if(car.description.isEmpty||car.id.isEmpty|| car.model.isEmpty || car.rNumber.isEmpty ){
    return;
  }
  if (c.id==car.id || c.rNumber == car.rNumber){
    Fluttertoast.showToast(
        msg: "la voiture existe déjà",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return;
  }
}

   if (f == null) {
          Fluttertoast.showToast(
        msg: "vous devez sélectionner une photo",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );     
       return;

        };
   
    final destination = 'images/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/$fileName');
                Fluttertoast.showToast(
        msg: "Téléchargement...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );  
      await ref.putFile(f!);
      print("image added to $destination");
    } catch (e) {
      Fluttertoast.showToast(
        msg: "une erreur s'est produite",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );      
}

 return cars
          .add(
          {
            'rNumber':car.rNumber,
            'model':car.model,
            'image':car.image,
            'description':car.description,
            'id':car.id,
            'window':0,
            'energy':0,
            'door':0,
            'robbery':0

          })
          .then((value) => showDialog(context: ctx, builder: (contxt)=>const MyDialog()))
          .catchError((error) => print("Failed to add user: $error"));
    }

Future<void> getAllCars()async {
   QuerySnapshot querySnapshot = await cars.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    allCars= allData.map((e) => Car.fromJSON(e as Map<String,dynamic>)).toList();

    print("final cars: $allCars");
}


//input validation
String? validModel(String v){
  if(v.isEmpty) return'Nom du modèle obligatoire';

}
String? validId(String v){
  if(v.isEmpty) return'ID obligatoire';
}
String? validDesc(String v){
  if(v.isEmpty) return'Description obligatoire';
}
String? validMatricule(String v){
  if(v.isEmpty||!v.contains('tunis')) return'000 tunis 0000';
}

}
  