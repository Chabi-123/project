import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/pages/browser_page.dart';
import 'package:project/pages/fullbody_page.dart';
import 'package:project/pages/progress_page.dart';
import 'package:project/pages/video_pages.dart';

class WorkoutPages extends StatefulWidget {
  const WorkoutPages({super.key});

  @override
  State<WorkoutPages> createState() => _WorkoutPagesState();
}

class _WorkoutPagesState extends State<WorkoutPages> {
  final List<String> imgList = [
    'assets/images/img2.jpg.jpg',
    'assets/images/img3.jpg.jpg',
    'assets/images/img4.jpg.jpg',
    'assets/images/img5.jpg.jpg',
    'assets/images/img6.jpg.jpg',
    'assets/images/img7.jpg.jpg',
  ];
  final List<String> textList = [
    'Running',
    'Yoga',
    'Gym',
    'Aerobic',
    'cycling',
  ];


  int _currentPage = 0;
  bool check=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('WorkOut Plan',style: myStyle(22, Colors.white, FontWeight.bold),),
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (builder)=>BrowsePages(
                ),
                ),
              );
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Text('Browse',style: myStyle(25, Colors.white, FontWeight.bold),)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text("It's Your Workout: Your Time.....", style: myStyle(20, Colors.black, FontWeight.bold),),
              SizedBox(height: 30,),
              Column(
                children: [
                  CarouselSlider(items: imgList.map((e){
                    return Image.asset(e);
                  }).toList(),
                    options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (value, _){
                          setState(() {
                            _currentPage = value;
                          }
                          );
                        }
                    ),
                  ),
                  buildIndicator(),


                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Your Plan",style: myStyle(22, primaryColor, FontWeight.bold)),
                      InkWell(
                          onTap: (){
                            if(check==false){
                              setState(() {
                                check=true;
                              });
                            }
                            else{
                              setState(() {
                                check=false;
                              });
                            }
                          },
                          child: Text("See all",style: myStyle(17, primaryColor, FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: 15,),

                  check? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10),
                                color: primaryColor,
                              ),
                              child: Center(
                                  child: Text("For You", style: myStyle(18, Colors.white, FontWeight.bold),)
                              )
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (builder)=>FullBodyPages(
                            ),
                            ),
                          );
                        },

                        child: Column(
                          children: [
                            Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(10),
                                  color: primaryColor,
                                ),
                                child: Center(
                                    child: Text("Full body", style: myStyle(18, Colors.white, FontWeight.bold),)
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ):SizedBox(width: 10,),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 200,
                        width: 360,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/gif2.gif"), fit: BoxFit.cover,)
                        ),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Arm Strength Beginner", style: myStyle(20, Colors.white, FontWeight.bold),),
                              Text("Workout", style: myStyle(20, Colors.white, FontWeight.bold),),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("29 min", style: myStyle(15, Colors.white),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(30),
                                          color: Colors.orange,
                                        ),
                                        child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(
                                                MaterialPageRoute(builder: (builder)=>DemoUrlLauncher(
                                                ),
                                                ),
                                              );
                                            },

                                            child: Icon(Icons.play_arrow, size: 30,color: Colors.white,)),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),

                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                      border: Border.all(color: Colors.black),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder)=>ProgressPages(
                          ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("See Workout Progree", style: myStyle(18, Colors.white, FontWeight.bold),),
                          SizedBox(width: 20,),
                          Icon(Icons.read_more_rounded, color: Colors.white, size: 30,)
                        ],
                      ),
                    ),
                  ),
                 ]
              ),
            ],
          ),
        ),
      ),
    );
  }
  buildIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: 7,
            width: i == _currentPage ? 35 : 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: i == _currentPage ? Colors.black : primaryColor,
            ),
          )

      ],
    );
  }

}
