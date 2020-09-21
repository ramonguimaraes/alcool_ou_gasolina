import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  var _textEditingController = TextEditingController();

  String hint = "hintTextHere";

  CustomTextField(controller, hint) {
    this._textEditingController = controller;
    this.hint = hint;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              letterSpacing: 5,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            border: InputBorder.none),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
