import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/frame/show_logo.dart';
import 'package:tdvpnext/utility/frame/show_text.dart';
import 'package:tdvpnext/utility/stylepro.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      //backgroundColor: Colors.lime.shade200,
      backgroundColor: Color.fromARGB(255, 255, 214, 214),
      title: ListTile(
        leading: Container(
          width: 50,
          child: Image.asset('assets/images/master.png'),
        ),
        title: Text(string),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'ตกลง',
                style: TextStyle(
                    fontFamily: 'THSarabunNew',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}




class MyDialog {
  Future<void> normalDialog(BuildContext context, String title, String message,
      {Function()? pressFunc}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowLogo(),
          title: ShowText(
            title: title,
            textStyle: StyleProjects().H11style, label: '',
          ),
          subtitle: ShowText(title: message, label: '',),
        ),
        actions: [
          TextButton(
            onPressed: pressFunc ?? (){
               Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

