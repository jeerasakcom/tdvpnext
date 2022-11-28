import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/models/users_model.dart';
import 'package:tdvpnext/utility/dialog.dart';
import 'package:tdvpnext/utility/frame/show_forms.dart';
import 'package:tdvpnext/utility/frame/show_process.dart';
import 'package:tdvpnext/utility/stylepro.dart';


class UpdateProfileCustomer extends StatefulWidget {
  final String? docIdProfile;
  const UpdateProfileCustomer({Key? key, this.docIdProfile}) : super(key: key);

  @override
  _UpdateProfileCustomerState createState() => _UpdateProfileCustomerState();
}

class _UpdateProfileCustomerState extends State<UpdateProfileCustomer> {
  UserModel? userModel;

  TextEditingController fnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> map = {};
  String? docIdProfile;

  @override
  void initState() {
    super.initState();
    docIdProfile = widget.docIdProfile;
    print('@@ docIdProfile ==>> $docIdProfile');

    readCurrentProfile();
  }

  Future<void> readCurrentProfile() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((value) {
        for (var item in value.docs) {
          setState(() {
            userModel = UserModel.fromMap(item.data());
            fnameController.text = userModel!.fname!;
            addressController.text = userModel!.address!;
            phoneController.text = userModel!.phone!;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        title: const Text('แก้ไขข้อมูลส่วนบุคคล'),
      ),
      body: userModel == null
          ? const ShowProcess()
          : GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(FocusScopeNode()),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ShowForm(
                        title: 'ชื่อ :',
                        myValidate: nameValidate,
                        mySave: nameSave,
                        textEditingController: fnameController,
                      ),
                      ShowForm(
                        title: 'ที่อยู่ :',
                        myValidate: addressValidate,
                        mySave: addressSave,
                        textEditingController: addressController,
                      ),
                      ShowForm(
                        title: 'เบอร์โทรศัพท์ :',
                        myValidate: phoneValidate,
                        mySave: phoneSave,
                        textEditingController: phoneController,
                      ),
                      buttonEditShop(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  SizedBox buttonEditShop() {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('@@ map ==> $map');

            if (map.isEmpty) {
              MyDialog().normalDialog(
                  context, 'Not Change', 'ไม่มีการเปลียน อะไร ? เลย');
            } else {
              await FirebaseAuth.instance
                  .authStateChanges()
                  .listen((event) async {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(event!.uid)
                    .update(map)
                    .then((value) => Navigator.pop(context))
                    .catchError((value) {
                  print('@@ error ==>> $value');
                });
              });
            }
          }
        },
        child: const Text('บันทึก'),
      ),
    );
  }

  void nameSave(String? string) {
    if (string != userModel!.fname) {
      print('name ใหม่ ==> $string');
      map['nameShop'] = string;
    }
  }

  String? nameValidate(String? string) {
    if (string!.isEmpty) {
      return 'กรุณากรอกชื่อ';
    } else {
      return null;
    }
  }

  void addressSave(String? string) {
    if (string != userModel!.address) {
      map['address'] = string;
    }
  }

  String? addressValidate(String? string) {
    if (string!.isEmpty) {
      return 'กรุณากรอกที่อยู่';
    } else {
      return null;
    }
  }

  void phoneSave(String? string) {
    if (string != userModel!.phone) {
      map['phone'] = string;
    }
  }

  String? phoneValidate(String? string) {
    if (string!.isEmpty) {
      return 'กรุณากรอกเบอร์ ';
    } else {
      return null;
    }
  }
}
