import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/components/customer/customerservice/customer_profile.dart';
import 'package:tdvpnext/components/customer/dashboard/dashboardpage.dart';
import 'package:tdvpnext/components/customer/file/recommend.dart';
import 'package:tdvpnext/components/customer/profile/customer_dataprofile.dart';
import 'package:tdvpnext/components/customer/profile/edit_profile.dart';
import 'package:tdvpnext/components/guest/Authentication/authentication.dart';
import 'package:tdvpnext/components/guest/homescreen/homescreen.dart';
import 'package:tdvpnext/components/guest/register/registerpages.dart';
import 'package:tdvpnext/models/user_model.dart';
import 'package:tdvpnext/utility/logout_dialog.dart';
import 'package:tdvpnext/utility/stylepro.dart';

class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  UserModel? userModel;
  //Widget currentWidget = CustomerProfilePage(uid: '',);
  Widget currentWidget = const DashboardPage();

  @override
  void initState() {
    super.initState();
    findUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        actions: <Widget>[
          //LogoutDialog(),

          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticationPage()),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildUserAccountsDrawerHeader(),
                  buildListProfile(),
                  buildListPublishing(),
                  buildListFilePrint(),
                  buildListHistory(),
                  buildListJobTracking(),
                  buildListTransport(),
                ],
              ),
            ),
            buildLogout(),
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildListProfile() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.assignment_ind, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '??????????????????????????????????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) => CustomerProfilePage(uid: '',)),
          MaterialPageRoute(
            builder: (context) => const CustomerDataProfilePage(),
            //EditProfile(),
          ),
        );
      },
    );
  }

  ListTile buildListPublishing() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.shopping_cart_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '????????????????????????/???????????????????????????????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerService()),
        );
      },
    );
  }

  ListTile buildListFilePrint() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.cloud_upload, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '??????????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecommendFilePrint()),
        );
      },
    );
  }

  ListTile buildListHistory() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.description_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '??????????????????????????????????????????????????????/???????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerService()),
        );
      },
    );
  }

  ListTile buildListJobTracking() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.invert_colors_on_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '??????????????????????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerService()),
        );
      },
    );
  }

  ListTile buildListTransport() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.beenhere_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        '?????????????????????????????????????????????',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerService()),
        );
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/img00100.jpg'),
          image: AssetImage('assets/images/img00100.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
              //backgroundImage: NetworkImage(userModel.images),
            ),
      accountName: Row(
        children: [
          Text(
            '?????????',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'fname',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          Text(
            '???????????????',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'email',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Column buildLogout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            onTap: () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthenticationPage(),
                        ),
                        (route) => false));
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: Text(
              '??????????????????????????????',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> findUserLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event!.uid;
        print('uid ===>> $uid');
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {
            /*
            userModel = UserModel.fromJson(event.data()!);
            //userModel = UserModel.fromJson(event.data());
            switch (userModel!.level) {
                case 'customer':
                  if (userModel!.level == 'customer') {
                    Navigator.pushNamedAndRemoveUntil(
                        context, StyleProjects.routeCustomer, (route) => false);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, StyleProjects.routeAdmin, (route) => false);
                  }

                  break;
                default:
              }
              */

            //
          });
        });
      });
    });
  }

  //
}
