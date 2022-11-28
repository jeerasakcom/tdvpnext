import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdvpnext/models/category_model.dart';
import 'package:tdvpnext/models/user_model.dart';
import 'package:tdvpnext/utility/dialog.dart';
import 'package:tdvpnext/utility/stylepro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';




class CreateCategoryPage extends StatefulWidget {
  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  File? file;
  String? id;
  String? images, name;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg103.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StyleProjects().boxSpaceTop,
              _backButton(),
              StyleProjects().boxSpaceTop2,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 1,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StyleProjects().boxSpaceTop,
                    StyleProjects().header1(),
                    StyleProjects().boxSpaceTop2,
                    //StyleProjects().headerReg(),
                    Center(
                      child: Text(
                        'เพิ่มผู้ดูแลระบบ',
                        style: StyleProjects().H2style,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: blockAvartar(),
                    ),
                    StyleProjects().boxSpaceTop2,
                    blockfname(),
                    blockCreateCategoryPage(),
                    StyleProjects().boxSpaceTop2,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row blockAvartar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => chooseAvatar(ImageSource.camera),
        ),
        Container(
          width: 100,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: file == null
                ? Image.asset('assets/images/avatar.png')
                : CircleAvatar(
                    backgroundImage: FileImage(file!),
                  ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add_photo_alternate,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => chooseAvatar(ImageSource.gallery),
        ),
      ],
    );
  }

  Container blockfname() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.location_history_rounded,
              color: Colors.white,
            ),
            labelText: "ชื่อ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

//
Future<Null> insertProducts() async {
    CategoryModel model = CategoryModel(
        id: id,
        categoryname: name,
        images: images);

    Map<String, dynamic> map = model.toJson();

    //await
    FirebaseFirestore.instance
        .collection('Category')
        .doc()
        .set(map)
        .then((value) => Navigator.pop(context));
  }




//



  Future<Null> chooseAvatar(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      print('path ==>> ${result!.path}');
      setState(() {
        file = File(result.path);
      });
    } catch (e) {
      print('e chooseAvatar ==> ${e.toString()}');
    }
  }



  
  
  Future uploadAvatarToFirebase(String uid) async {
    print('uid ==>> $uid');
    String nameAvatar = '$uid.jpg';

    String images = await (await FirebaseStorage.instance
            .ref()
            .child('Avatar/$nameAvatar')
            .putFile(file!))
        .ref
        .getDownloadURL();
    print('images = $images');
    insertDataToCloudFirestore(images, uid);
  }

  Future<Null> insertDataToCloudFirestore(String images, String uid) async {
    CategoryModel model = CategoryModel(
      id: id,
      categoryname: name,
      images: images,
    );

    Map<String, dynamic> map = model.toJson();

    await FirebaseFirestore.instance.collection('Category').doc(uid).set(map).then(
        (value) => 
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateCategoryPage())));
  }

  Container blockCreateCategoryPage() => Container(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 6,
          child: Text(
            'ลงทะเบียน',
            style: StyleProjects().TopicMainT3_1,
          ),
          onPressed: () {
            if (file == null) {
              normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
            } else if (name == null ||
                name!.isEmpty ||
                name == null ||
                name!.isEmpty) {
              normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
            } else {
              print('name = $name,');
            }
          },
        ),
      );



  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: const Color(0xffffda7a),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 18,
                color: const Color(0xffffda7a),
              ),
            )
          ],
        ),
      ),
    );
  }
}
