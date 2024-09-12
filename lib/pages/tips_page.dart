import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/tips_data.dart';
class TipsFitness extends StatefulWidget {
  const TipsFitness({super.key});

  @override
  State<TipsFitness> createState() => _TipsFitnessState();
}

class _TipsFitnessState extends State<TipsFitness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: primaryColor,
        title: Center(child: Text("Fitness Tips For Beginners",style: myStyle(22,Colors.white,FontWeight.bold),)),


      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: primaryColor,
          width: double.infinity,
          child: Column(
              children: [
                Image(image: AssetImage("assets/images/fit_girl-removebg-preview.png")),
                Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                      color: CupertinoColors.systemGrey4,
                    ),
                    child:ListView.builder(
                        itemCount: Tips.length,
                        shrinkWrap: true,
                        itemBuilder:(context,index){
                          return Container(
                            margin: EdgeInsets.all(12),
                            height: 80,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft:Radius.circular(50),topRight: Radius.circular(20),bottomRight: Radius.circular(20),),
                              color: primaryColor,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(7),
                                      height: 65,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(image: AssetImage("${Tips[index].images}"),fit: BoxFit.cover),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text("${Tips[index].name}",style: myStyle(20,Colors.white),),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                    )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
