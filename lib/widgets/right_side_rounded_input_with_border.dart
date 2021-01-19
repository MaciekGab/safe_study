import 'package:flutter/material.dart';

class RightRoundedInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget suffixIcon;
  final TextStyle style;
  // final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const RightRoundedInput({Key key, this.hintText, this.controller, this.suffixIcon, this.style, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30.0)
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(112, 35, 238, 0.7),
              blurRadius: 5.0),
        ],
      ),
      width: size.width * 0.8,
      padding: EdgeInsets.only(
        left: 15.0,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: style,
        cursorColor: Color.fromRGBO(112, 35, 238, 1),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: InputBorder.none
        ),
      ),
    );
  }
}
