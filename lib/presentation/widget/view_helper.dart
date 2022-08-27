import 'package:flutter/material.dart';

snackBar(BuildContext context, String? message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
      duration: Duration(seconds: 2),
    ),
  );
}

showAlert(BuildContext context, String text) {
  var alert = new AlertDialog(
    content: Container(
      child: Row(
        children: <Widget>[Text(text)],
      ),
    ),
    actions: <Widget>[
      new TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ))
    ],
  );

  showDialog(
      context: context,
      builder: (_) {
        return alert;
      });
}

String countryCodeToEmoji(String countryCode) {
  final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}
