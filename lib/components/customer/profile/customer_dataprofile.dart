import 'package:avatar_view/avatar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/components/customer/profile/customer_updateprofile.dart';
import 'package:tdvpnext/components/customer/profile/edit_profile.dart';
import 'package:tdvpnext/models/users_model.dart';
import 'package:tdvpnext/utility/frame/show_image_avatar.dart';
import 'package:tdvpnext/utility/frame/show_process.dart';
import 'package:tdvpnext/utility/frame/show_text.dart';
import 'package:tdvpnext/utility/stylepro.dart';

/*
class CustomerDataProfilePage extends StatelessWidget {
  /*
  CustomerDataProfilePage({required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 2,
                        color: const Color(0xff0d569f),
                      ),
                    ),
                  ),
                  Text(
                    "แก้ไขข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontFamily: 'TH Sarabun New',
                      fontSize: 20,
                      color: const Color(0xff0d569f),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 2,
                        color: const Color(0xff0d569f),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*
              new Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home() ));
                      },
                      child : Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        color: const Color(0xffb3e5fc),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/002.png',
                              height: 75,
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'แบบสิ่งพิมพ์',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'TH Sarabun New',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff04066b),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),

               */
          ],
        ),
      ),
      
    );
  }
}
*/


*/

class CustomerDataProfilePage extends StatefulWidget {
  const CustomerDataProfilePage({Key? key}) : super(key: key);

  @override
  State<CustomerDataProfilePage> createState() =>
      _CustomerDataProfilePageState();
}

class _CustomerDataProfilePageState extends State<CustomerDataProfilePage> {
  var user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool load = true;

  @override
  void initState() {
    super.initState();
    readProfile();
  }

  Future<void> readProfile() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        load = false;
        userModel = UserModel.fromMap(value.data()!);
        print('userModel ==> ${userModel!.toMap()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        //backgroundColor: StyleProjects().backgroundState,
      ),

      /*
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(
                    //userModel: userModel!,
                  ),
                )).then((value) {
              readProfile();
            });
          },
          child: const Text('Edit Profile')),
      

      */

//
/*
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        label: Text('แก้ไขข้อมูล',style: StyleProjects().TopicMainT3_6,),
        backgroundColor: StyleProjects().baseColor,
      ),
      */

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    /* EditProfile(
                    //userModel: userModel!,
                    ),
                    */
                    UpdateProfileCustomer(),
              )).then((value) {
            readProfile();
          });
        },
        backgroundColor: Colors.amber,
        //backgroundColor: StyleProjects().baseColor,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      backgroundColor: StyleProjects().backgroundState,

      body: load
          ? const Center(child: ShowProcess())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyleProjects().boxSpaceTop2,
                  Center(
                    child: Text(
                      'ข้อมูลส่วนบุคคลลูกค้า',
                      style: StyleProjects().contentstyle1,
                    ),
                  ),
                  StyleProjects().boxSpaceTop2,
                  //

                  AvatarView(
                    radius: 75,
                    borderWidth: 8,
                    // borderColor: Colors.yellow,
                    // borderColor: Color(0xff033674),
                    borderColor: Color(0xfff8d800),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

                  //
                  /*
                  ShowImageAvatar(
                    urlImage: userModel!.images!,
                    size: 75,
                  ),
                  */

                  //
                  StyleProjects().boxSpaceTop2,
                  newLabel(head: 'ชื่อ :', value: userModel!.fname!),
                  newLabel(head: 'นามสกุล :', value: userModel!.lname!),
                  newLabel(head: 'ที่อยู่ :', value: userModel!.address!),
                  newLabel(head: 'ตำบล :', value: userModel!.subdistrict!),
                  newLabel(head: 'อำเภอ :', value: userModel!.district!),
                  newLabel(head: 'จังหวัด :', value: userModel!.province!),
                  newLabel(head: 'รหัสไปรษณีย์ :', value: userModel!.zipcode!),
                  newLabel(head: 'เบอร์โทรศัพท์ :', value: userModel!.phone!),
                  newLabel(head: 'Email :', value: userModel!.email!),
                ],
              ),
            ),
    );
  }

  Row newLabel({required String head, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ShowText(
            title: head,
            textStyle: StyleProjects().contentstyle2,
            label: '', //TopicMain11, //titleH4StyleK,
          ),
        ),
        Expanded(
          flex: 3,
          child: ShowText(
            title: value,
            textStyle: StyleProjects().contentstyle2,
            label: '',
          ),
        ),
      ],
    );
  }
}
