import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image_picker/image_picker.dart';

class AddController with ChangeNotifier{
  XFile ? img=null;
  File ? f ;
  final ImagePicker _picker = ImagePicker();

  Future  getimage() async{

  img = await _picker.pickImage(source: ImageSource.gallery);
  if (img!= null)
  f = File (img!.path);

  notifyListeners();
  
  }
  
}