import 'package:driver_app/utils/color.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final controller;

  const CustomTextField(
      {Key? key,
      required this.hint,
       this.prefixIcon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: textFieldStroke, width: 1),
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 2),
              color: black.withOpacity(0.25),
              blurRadius: 5)
        ],
      ),
      child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLines: 1,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your Email';
            }
            return null;
          },
          style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.01,
                left: 10
              ),
              prefixIcon: prefixIcon,
              labelStyle: const TextStyle(),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: white),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: white),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: white),
              ),
              hintText: hint,
              hintStyle:
                  TextStyle(fontFamily: 'Poppins', fontSize: 14, color: grey)
              // labelText:"Your Name"
              )),
    );
  }
}
