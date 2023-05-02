
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class InputText extends StatelessWidget {
  final String hint;
  final bool ? obs;
  final IconData ? icon;
  final void Function() ? click;
  final String? Function(String?)? validator;
  final TextInputType ? type ;
  final TextEditingController? controler;
  const InputText({super.key, required this.hint,this.obs,this.icon,this.click,this.type,this.validator,this.controler});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    validator: validator,
    controller: controler,
    obscureText: obs ?? false,
    keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        hintText:hint,
            suffixIcon: obs != null?InkWell(onTap:click, child: Icon(icon)):null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:ConstColors.maincolor,)
            )
          ),
    );
  }
}