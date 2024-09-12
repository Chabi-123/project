// import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
// import 'package:fitness_group/constant.dart';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:project/constant_file/contsant.dart';


class ProgressPages extends StatefulWidget {
  const ProgressPages({super.key});

  @override
  State<ProgressPages> createState() => _ProgressPagesState();
}

class _ProgressPagesState extends State<ProgressPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Goal Progress", style: myStyle(25, Colors.white, FontWeight.bold),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Text("Daily WorkOut", style: myStyle(25, primaryColor,FontWeight.bold),),
                  Gap(30),
                  Container(
                    height: 180,
                    width: 350,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.4)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/animations/progress.json"),],
                    ),

                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Weight Meter", style: myStyle(23, Colors.black, FontWeight.bold),),
                    ],
                  ),Column(
                    children: [
                      Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                          child: Center(child: Text("Edit", style: myStyle(20, Colors.black,),))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),

              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ArcProgressBar(
                          percentage: 52.4,
                          arcThickness: 7,
                          innerPadding: 31,
                          animateFromLastPercent: true,
                          handleSize: 20,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.blueAccent),
                      Positioned(
                          bottom: 50,
                          child: Column(
                            children: [
                              Text('now', style: myStyle(20, Colors.black),),
                              Text("52.4 Kg",style: myStyle(25, Colors.purple, FontWeight.bold),),
                              SizedBox(height: 20,),
                              Text("Dropped-4 kg",style: myStyle(20, Colors.black),)
                            ],
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [Text("Statistics", style: myStyle(20, Colors.black, FontWeight.bold),)],
                  ), Column(
                    children: [Text("Week", style: myStyle(20, Colors.black, FontWeight.bold),)],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Image(image: AssetImage("assets/images/gragh.png")))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
