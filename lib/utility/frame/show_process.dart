import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/frame/show_text.dart';


class ShowProcess extends StatelessWidget {
  const ShowProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}