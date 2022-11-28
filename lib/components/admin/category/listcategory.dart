import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tdvpnext/components/admin/products/addproducts.dart';
import 'package:tdvpnext/components/admin/products/mis_addproducts.dart';
import 'package:tdvpnext/models/category_model.dart';
import 'package:tdvpnext/models/product_model.dart';
import 'package:tdvpnext/utility/stylepro.dart';
import 'package:flutter/cupertino.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({Key? key}) : super(key: key);

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  String? id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String? productid, name, detail, price, quantity;
  bool trapicondelete = false;
  ProductModel? productModel;

  //

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("ยกเลิก"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text("ลบ"),
      onPressed: () {
        deleteDataNew;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("คำเตือน!"),
      content: Text("คุณต้องการลบแบบพิมพ์นี้ ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //

  deleteDataNew(DocumentSnapshot doc) async {
    FirebaseFirestore.instance
        .collection('Category')
        .doc(doc.id)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  //ลบ Products จาก DB
  void deleteData(DocumentSnapshot doc) async {
    //await db.collection('Products').document(doc.documentID).delete();
    await db.collection('Category').doc(doc.id).delete();
    setState(() => id = null);
  }

  //new dialog
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'คำเตือน',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              //color: const Color(0xffffda7a),
              //color: const Color(0xFFFF0080),
              color: const Color(0xFFE20057),
            ),
          ),
          content: Text(
            'คุณต้องการลบแบบพิมพ์นี้ ?',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              //color: const Color(0xffffda7a),
              color: const Color(0xff000f3b),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: Text(
                'ลบ',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: const Color(0xffffda7a),
                  color: const Color(0xFFFC0022),
                ),
              ),

              onPressed: () async {
                await db.collection('Products').doc(id).delete();
                setState(() => id = null);
                //deleteData(doc!),
                Navigator.pop(context);
              },
/*
              onPressed: () async {
                await db.collection('News').doc().delete();
              },
              */

              ///
              /*
              onPressed: () async {
                await db.collection('Products').doc(id).delete();
                setState(() => id = null);
              },
              */

              //
            ),
            new FlatButton(
              child: Text(
                'ยกเลิก',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: const Color(0xffffda7a),
                  color: const Color(0xff000f3b),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),*/

/*
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'ค้นหา...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),



      */

      //backgroundColor: const Color(0xFFF7F7F7),
      //backgroundColor: Color.fromARGB(255, 29, 47, 102),
      //backgroundColor: Color.fromARGB(255, 91, 100, 156),
      backgroundColor: Color.fromARGB(255, 0, 52, 163),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          height: height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              StyleProjects().BoxSpace,
              StyleProjects().header1(),
              StyleProjects().boxSpaceTop2,

//ค้นหา
/*
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Card(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search), hintText: 'ค้นหา...'),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                ),
              ),


*/
              //StyleProjects().boxSpaceTop2,

              // header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          //color: const Color(0xff000f3b),
                          color: const Color(0xffffda7a),
                        ),
                      ),
                    ),
                    Text(
                      'แบบสิ่งพิมพ์',
                      textAlign: TextAlign.center,
                      style: StyleProjects().H2style,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//2

/*
                const SizedBox(height: 10),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        .orderBy('id')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Text(
                          "ไม่มีข้อมูล",
                          style: StyleProjects().TopicMain2,
                        );
                      return Text(
                        'กรุณารอสักครู่นะคะ...',
                        style: StyleProjects().TopicMain6,
                      );
                    },
                  ),
                ),
              
              */

              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Category")
                        //.orderBy('id', descending: true)
                        .orderBy('id')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().H2style,
                        );
                      }
                      /*
                        int length = snapshot.data!.docs.length;
                        
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: length,
                            padding: EdgeInsets.all(5),
                            itemBuilder: (_, int index) {
                              final QueryDocumentSnapshot<Object?>? doc =
                                  snapshot.data?.docs[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                //padding: EdgeInsets.all(5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  //color: const Color(0xFF3B3B3B),
                                  //color: const Color(0xFFABDCFF),
                                  color: const Color(0xFF20DAE9),
                                  //color: const Color(0xFFFFFFFF),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Image.network(
                                                snapshot.data?.docs
                                                    .elementAt(index)['images'],
                                                width: 100,
                                                height: 85,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 120,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['category'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'รหัสสินค้า :',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 65,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['id'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'ชื่อสินค้า :',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 65,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['name'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'ราคา :',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            snapshot.data!.docs
                                                .elementAt(index)['price']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'บาท',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            child: new Row(
                                              children: <Widget>[
                                                IconButton(
                                                  icon: Icon(
                                                    //Icons.description,
                                                    Icons.edit,
                                                    color: Colors.blueAccent,
                                                  ),
                                                  onPressed: () {
                                                    /*
                                                    Route route = MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateProductsPages());
                                                    
                                                    Navigator.push(
                                                        context,  route);
                                                        */

                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                /*
                                              IconButton(
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.blueAccent,
                                                ),
                                                onPressed: () {},
                                              ),
                                              */
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                  ),

                                                  //ลบเลย

                                                  onPressed: () =>
                                                      deleteData(doc!),

                                                  // แสดง alert
                                                  /*
                                                onPressed: () async {
                                                  showAlertDialog(context);
                                                },
                                                */

                                                  // ลบแล้ว pop
                                                  /*
                                                onPressed: () async {
                                                  setState(() {
                                                    trapicondelete = true;
                                                  });

                                                  await deleteData(doc);

                                                  setState(() {
                                                    trapicondelete = false;
                                                  });

                                                  Navigator.of(context).pop();
                                                },

                                                */
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      
                      */

                      int length = snapshot.data!.docs.length;
                      return ListView.builder(
                          itemCount: length,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (_, int index) {
                            final QueryDocumentSnapshot<Object?>? doc =
                                snapshot.data?.docs[index];
                            return Card(
                              margin: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              //color: const Color(0xFF3B3B3B),
                              //color: const Color(0xFFABDCFF),
                              //color: const Color(0xFF20DAE9),
                              color: const Color(0xFFFFFFFF),

                              child: Container(
                                height: 120,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                //padding: EdgeInsets.all(10),

                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          /*
                                            Text(
                                              'รูปภาพสินค้า',
                                              style:
                                                  StyleProjects().TopicMain3U2,
                                              textAlign: TextAlign.justify,
                                            ),
                                            */

                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              width: 200,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                     
                                     
                                     
                                     */
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'รหัสหมวดหมู่ :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                StyleProjects().boxSpacebetween,
                                                Container(
                                                  width: 50,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(index)['id'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                            .elementAt(index)[
                                                        'categoryname'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

/*
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(
                                                            index)['category'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'รหัสสินค้า :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                Container(
                                                  width: 65,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(index)['id'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'ชื่อสินค้า :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                Container(
                                                  width: 65,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(
                                                            index)['name'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                      */

                                    Expanded(
                                      child:
                                          /*Icon(
                                        CupertinoIcons.plus_circled,
                                        semanticLabel: 'Add',
                                      ),


                                      */
                                          IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Color.fromARGB(
                                                255, 126, 201, 103)),
                                        //onPressed: () {},
                                        onPressed: () {
                                          Route route = MaterialPageRoute(
                                            builder: (context) => //CreateNewProductPage(),
                                                AddProductPage(),
                                          );
                                          Navigator.push(context, route);
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color:
                                              Color.fromARGB(255, 219, 49, 49),
                                        ),
                                        onPressed: () => deleteData(doc!),
                                      ),
                                    ),

/*
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 30),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit,
                                                  color: Color.fromARGB(
                                                      255, 126, 201, 103)),
                                              //onPressed: () {}, //UpdateDataProductsPages
                                              onPressed: () {
                                                Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      //UpdateProductsPage(productModel: id,),
                                                      AddProductPage(),
                                                );
                                                Navigator.push(context, route);
                                              },
                                            ),

                                            //true
                                            /*
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 219, 49, 49),
                                              ),
                                              onPressed: () => deleteData(doc!),
                                            ),

                                            */

//

                                            IconButton(
                                                onPressed: () {
                                                  //deleteDataNew(doc!);
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            //Color.fromARGB(255, 255, 199, 199),
                                                            Color.fromARGB(255,
                                                                255, 222, 222),
                                                        title: Text(
                                                          'คำเตือน',
                                                          style: StyleProjects()
                                                              .TextAlertH1Style,
                                                        ),
                                                        content: Text(
                                                          'คุณต้องการลบแบบพิมพ์นี้ ?',
                                                          style: StyleProjects()
                                                              .TextAlertH2Style,
                                                        ),
                                                        actions: <Widget>[
                                                          new FlatButton(
                                                            child: Text(
                                                              'ลบ',
                                                              style: StyleProjects()
                                                                  .TextAlertH3Style,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              deleteDataNew(
                                                                  doc!);
                                                              //deleteData(doc!),
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                          new FlatButton(
                                                            child: Text(
                                                              'ยกเลิก',
                                                              style: StyleProjects()
                                                                  .TextAlertH2Style,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Color.fromARGB(
                                                      255, 219, 49, 49),
                                                )),

                                            //
                                          ],
                                        ),
                                      ),
                                    ),
                                  
                                  */
                                  ],
                                ),

                                //
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 0, 110, 244),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => AddProductPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
