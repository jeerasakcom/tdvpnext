import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/stylepro.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /*
      appBar: AppBar(
        backgroundColor: StyleProjects().backgroundState,
      ),
      */
      

      //
      backgroundColor: StyleProjects().backgroundState,

      body: SingleChildScrollView(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      //
    );
  }
}
