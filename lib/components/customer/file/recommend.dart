import 'package:flutter/material.dart';
import 'package:tdvpnext/utility/stylepro.dart';

class RecommendFilePrint extends StatefulWidget {
  RecommendFilePrint({Key? key}) : super(key: key);

  @override
  State<RecommendFilePrint> createState() => _RecommendFilePrintState();
}

class _RecommendFilePrintState extends State<RecommendFilePrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: StyleProjects().darkColor,
      ),
      backgroundColor: StyleProjects().backgroundState,
      body: SingleChildScrollView(
        child: Container(
          /*
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyleProjects().boxSpaceTop,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                color: Colors.black54,
                margin: EdgeInsets.all(25),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyleProjects().boxSpaceTop,
                    StyleProjects().header1(),
                    StyleProjects().boxSpaceTop2,
                    Center(
                      child: Text(
                        'คำแนะนำ',
                        style: StyleProjects().H2style,
                      ),
                    ),
                    Center(
                      child: Text(
                        'สำหรับการส่งงานให้โรงพิมพ์ มีดังนี้',
                        style: StyleProjects().H2style,
                      ),
                    ),
                    //StyleProjects().boxSpaceTop,
                    StyleProjects().boxSpace2,

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "1.ปรับโหมดสี CMYK",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "2.ตั้งความละเอียดของไฟล์",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "3.ตั้งระยะขอบและระยะตัดตก",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "4.การแปลงตัวอักษร(Font)ให้กลายเป็นวัตถุ",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "5.ฝังไฟล์รูปภาพ",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StyleProjects().boxSpacebetweenI,
                        Text(
                          "6.ส่งผลิตด้วยไฟล์ PDF",
                          textAlign: TextAlign.left,
                          style: StyleProjects().H5style,
                        ),
                      ],
                    ),

                    /*
                    Text(
                      "1.ปรับโหมดสี CMYK",
                      textAlign: TextAlign.left,
                      style: StyleProjects().H2style,
                    ),

                    */

/*
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      // alignment: Alignment.topCenter,
                      child: Column(
                        ///mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StyleProjects().boxSpace2,
                          Text(
                            "1.ปรับโหมดสี CMYK",
                            textAlign: TextAlign.left,
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpace2,
                          Text(
                            "2.ตั้งความละเอียดของไฟล์",
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpace2,
                          Text(
                            "3.ตั้งระยะขอบและระยะตัดตก",
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpace2,
                          Text(
                            "4.การแปลงตัวอักษร (Font) ให้กลายเป็นวัตถุ",
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpace2,
                          Text(
                            "5.ฝังไฟล์รูปภาพ",
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpace2,
                          Text(
                            "6.ส่งผลิตด้วยไฟล์ PDF",
                            style: StyleProjects().H2style,
                          ),
                          StyleProjects().boxSpaceTop2,
                        ],
                      ),
                    ),
                  
                  */

                  
                    StyleProjects().boxSpaceTop2,

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'ตกลง',
                        style: StyleProjects().TopicMainT3_1,
                      ),
                    ),

                    StyleProjects().boxSpaceTop,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
