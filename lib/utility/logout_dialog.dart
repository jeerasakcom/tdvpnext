import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/frame/show_logo.dart';
import 'package:tdvpnext/utility/frame/show_text.dart';
import 'package:tdvpnext/utility/stylepro.dart';


class LogoutDialog extends StatefulWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color(0xffe2d4e8),
            title: ListTile(
              leading: ShowLogo(),
              title: ShowText(
                title: 'คุณต้องการออกจากระบบหรือไม่?',
                textStyle: StyleProjects().titleH4StyleK, label: '',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, StyleProjects.routeAuthen, (route) => false));
                },
                child: const Text('ตกลง'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ยกเลิก'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.exit_to_app),
    );
  }
}
