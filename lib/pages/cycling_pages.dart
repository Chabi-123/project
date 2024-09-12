import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/model/yoga_model.dart';

class CyclingPages extends StatelessWidget {
  YogaDetailsModel yogaDetailsModel;
  CyclingPages({super.key, required this.yogaDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back,color: Colors.white,)),

          backgroundColor: primaryColor,
          title: Text("${yogaDetailsModel.text11}", style: myStyle(25, Colors.white,FontWeight.bold),),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xffcfe1b9).withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),

                            child:Container(
                              margin: EdgeInsets.only(bottom: 60),
                              child: Center(child: Text("${yogaDetailsModel.text1}", style: myStyle(22, Colors.black,),)),

                            )
                        ),
                        Positioned(
                            right: 50,
                            top: 80,
                            child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffbbdefb).withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child:Container(
                                  margin: EdgeInsets.only(right: 60),
                                  child: Center(child: Text("${yogaDetailsModel.text2}", style: myStyle(22, Colors.black),)),
                                )
                            )
                        ),
                        Positioned(
                            right: -60,
                            top: 80,
                            child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffffd6ff).withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child:Container(
                                  margin: EdgeInsets.only(left: 60),
                                  child: Center(child: Text("${yogaDetailsModel.text4}", style: myStyle(21, Colors.black),)),

                                )
                            )
                        ),
                        Positioned(
                            top: 100,
                            child: Center(child: Text("${yogaDetailsModel.text3}", style: myStyle(25, Colors.black, FontWeight.bold),))
                        )
                        // Center(child: Text("${yogaDetailsModel.text3}", style: myStyle(28, Colors.white, FontWeight.bold),)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 100,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text5}", style: myStyle(21, Colors.black),)),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text6}", style: myStyle(21, Colors.black,),)),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text7}", style: myStyle(21, Colors.black),)),
                        ),
                      ],
                    ), SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text8}", style: myStyle(21, Colors.black),)),
                        ),
                      ],
                    ),SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text9}", style: myStyle(21, Colors.black),)),
                        ),
                      ],
                    ),SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffcaf0f8)
                          ),
                          child: Center(child: Text("${yogaDetailsModel.text10}", style: myStyle(21, Colors.black),)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
