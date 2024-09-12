import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/dite_data.dart';
import 'package:project/data/dite_detail_data.dart';
import 'package:project/pages/dite_detail_page.dart';
class CaloriesHome extends StatefulWidget {
  const CaloriesHome({super.key});

  @override
  State<CaloriesHome> createState() => _CaloriesHomeState();
}

class _CaloriesHomeState extends State<CaloriesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Weekly Diet Plan",style: myStyle(25,Colors.white,FontWeight.bold),),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      backgroundColor: CupertinoColors.systemGrey4,
      body: ListView.builder(
        itemCount: Meal.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return
            InkWell(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CaloriesInsideHome(insides: inside[index],)));
            },
              child: Column(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: Row(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),),
                              color: primaryColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(20),),
                                    image: DecorationImage(image: AssetImage("${Meal[index].image}"),fit: BoxFit.cover),
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Center(child: Text("${Meal[index].day}",style: myStyle(22,Colors.white,),),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${Meal[index].name}",style: myStyle(22,primaryColor,FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("${Meal[index].kcal}",style: myStyle(20,primaryColor,),),
                                SizedBox(height:10),
                                Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.grey)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("${Meal[index].fats}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${Meal[index].f}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.grey)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("${Meal[index].carbs}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${Meal[index].c}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border(right: BorderSide(color: Colors.grey)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("${Meal[index].pro}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${Meal[index].p}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}

