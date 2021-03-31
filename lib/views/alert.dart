import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String titulo, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(titulo),
            content: Text(message),
            backgroundColor: Colors.white,
            scrollable: true,
            actions: [
              ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      });
}
