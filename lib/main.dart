import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:tdvpnext/components/admin/category/mis_listcategory.dart';
import 'package:tdvpnext/components/admin/category/listcategory.dart';
import 'package:tdvpnext/components/customer/file/recommend.dart';
import 'package:tdvpnext/components/guest/homescreen/homescreen.dart';
import 'package:tdvpnext/utility/stylepro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/admin/category/addcategory.dart';
import 'components/admin/products/addproducts.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance();

//Orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });

//
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Color(0xff0d569f),
          primaryColor: Color(0xff041f78),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white),
      home:  
      //RecommendFilePrint(),
     // CreateCategoryPage(),

      //AddProductPage(),
      //const ListCategoryPage(),
      SplashPage(),
    );
  }
}



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePageDesign(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            Text(
              '????????????????????????????????????????????????????????????????????? ????????????????????????????????????\n'
                  'Territorial Defence Volunteers Printing',
              textAlign: TextAlign.center,
              style: StyleProjects().TopicMainT3,
            ),
          ],
        ),
      ),
    );
  }
}
