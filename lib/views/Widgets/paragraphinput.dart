import 'package:flutter/material.dart';

import '../../values/colors.dart';

class InputParagraph extends StatelessWidget {
  final String hint;
  final bool ? obs;
  final IconData ? icon;
  final void Function() ? click;
    final TextEditingController? controler;
  final String? Function(String?)? validator;

  final TextInputType ? type ;
  const InputParagraph({super.key, required this.hint,this.obs,this.icon,this.click,this.type,this.controler,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controler,
    keyboardType: type ?? TextInputType.text,
    maxLines: 10,
    minLines: 5,
      decoration: InputDecoration(
        
        
        hintText:hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:ConstColors.maincolor,)
              
            )
          ),
    );
  }
}