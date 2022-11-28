import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:tdvpnext/models/category_model.dart';
import 'package:tdvpnext/utility/stylepro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCategoryPage extends StatefulWidget {
  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  File? file;
  String? id, categoryname, images;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: height,
          child: Column(
            children: [
              StyleProjects().boxSpaceTop2,
              StyleProjects().header4(),
              StyleProjects().boxSpaceTop2,
              blockheader(),
              SizedBox(
                height: 10,
              ),
              blockcategoryid(),
              SizedBox(
                height: 10,
              ),
              blockContentsNews(),
              SizedBox(
                height: 10,
              ),
              blockImg(),
              blockSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockheader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'เพิ่มหมวดหมู่ใหม่',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF0FF0B3),
              //color: const Color(0xFFFAD961),
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockcategoryid() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'รหัสหมวดหมู่',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 2,
            minLines: 1,
            keyboardType: TextInputType.phone,
            onChanged: (value) => id = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              /*
              hintText:
                  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
            */
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockContentsNews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'รายละเอียด',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 5,
            minLines: 2,
            onChanged: (value) => categoryname = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              /*
              hintText:
                  "Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16 เมื่อเครื่องพิมพ์โนเนมเครื่องหนึ่งนำรางตัวพิมพ์มาสลับสับตำแหน่งตัวอักษรเพื่อทำหนังสือตัวอย่าง Lorem Ipsum อยู่ยงคงกระพันมาไม่ใช่แค่เพียงห้าศตวรรษ แต่อยู่มาจนถึงยุคที่พลิกโฉมเข้าสู่งานเรียงพิมพ์ด้วยวิธีทางอิเล็กทรอนิกส์ และยังคงสภาพเดิมไว้อย่างไม่มีการเปลี่ยนแปลง มันได้รับความนิยมมากขึ้นในยุค ค.ศ. 1960 เมื่อแผ่น Letraset วางจำหน่ายโดยมีข้อความบนนั้นเป็น Lorem Ipsum และล่าสุดกว่านั้น คือเมื่อซอฟท์แวร์การทำสื่อสิ่งพิมพ์ (Desktop Publishing) อย่าง Aldus PageMaker ได้รวมเอา Lorem Ipsum เวอร์ชั่นต่างๆ เข้าไว้ในซอฟท์แวร์ด้วย",
            */
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockImg() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ภาพหมวดหมู่',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.camera),
              ),
              Container(
                width: 150,
                height: 150,
                child: file == null
                    ? Image.asset(
                        'assets/images/b2.jpg',
                      )
                    : Image.file(file!),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockSaveButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        //color: const Color(0xFF32A54F),
        color: const Color(0xFF459522),
        child: Text(
          "บันทึก",
          style: TextStyle(
            fontFamily: 'THSarabunNew',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: const Color(0xffffffff),
          ),
        ),
        onPressed: () {
          if (file == null) {
            normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
          } else if (id == null ||
              id!.isEmpty ||
              categoryname == null ||
              categoryname!.isEmpty) {
            normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
          } else {
            uploadPicture();
            Navigator.of(context).pop();
            /*
            uploadPicture();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListNewsPage2(),
              ),
            );
            */
          }
        },
      ),
    );
  }

  Future<Null> uploadPicture() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String namePic = 'category$i.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child('category/$namePic');
    UploadTask storageUploadTask = storageReference.putFile(file!);
    await (await storageUploadTask).ref.getDownloadURL().then((value) {
      images = value;
      print('images = $images');
      CreateCategoryFirestore();
    });
  }

  Future<Null> CreateCategoryFirestore() async {
    CategoryModel model = CategoryModel(
      id: id,
      categoryname: categoryname,
      images: images,
    );

    Map<String, dynamic> map = model.toJson();

    //await
    FirebaseFirestore.instance
        .collection('Category')
        .doc()
        .set(map)
        .then((value) => Navigator.pop(context));
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );
    file = File(result!.path);
    setState(() {});
  }

  Row imageGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          Container(
            width: 150,
            height: 150,
            child: file == null
                ? Image.asset(
                    'assets/images/newspic002.jpg',
                  )
                : Image.file(file!),
          ),
          IconButton(
            icon: Icon(
              Icons.add_photo_alternate,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  Future<Null> normalDialog(BuildContext context, String string) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(string),
        children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                //color: const Color(0xff000f3b),
                color: const Color(0xffda0641),
              ),
            ),
          )
        ],
      ),
    );
  }
//
}
