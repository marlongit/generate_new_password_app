import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String titulo, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(titulo),
            content: SelectableText(
              message,
              showCursor: true,
              toolbarOptions: ToolbarOptions(
                  copy: true, selectAll: true, cut: false, paste: false),
            ),
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
