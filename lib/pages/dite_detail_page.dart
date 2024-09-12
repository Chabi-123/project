import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
class CaloriesInsideHome extends StatelessWidget {
  List insides;
  CaloriesInsideHome({super.key,required this.insides});

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
        title: Text("Invest in your health",style: myStyle(25,Colors.white,FontWeight.bold),),
        centerTitle: true,

      ),
      backgroundColor: CupertinoColors.systemGrey4,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: insides.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 180,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(image: AssetImage("${insides[index].images}"),fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
                                color:primaryColor,
                              ),
                              child: Center(child: Text("${insides[index].meals}",style: myStyle(20,Colors.white,FontWeight.bold),)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ListView.builder(
              itemCount: insides.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage("${insides[index].images}"),fit: BoxFit.cover),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${insides[index].name}",style: myStyle(20,primaryColor,FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("${insides[index].kcal}",style: myStyle(20,Colors.black,),),
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
                                          Text("${insides[index].fats}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${insides[index].f}",style: myStyle(15,Colors.black,),),
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
                                          Text("${insides[index].carbs}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${insides[index].c}",style: myStyle(15,Colors.black,),),
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
                                          Text("${insides[index].pro}",style: myStyle(20,primaryColor,),),
                                          SizedBox(height:10),
                                          Text("${insides[index].p}",style: myStyle(15,Colors.black,),),
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
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
