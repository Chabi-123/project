
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/browser_data.dart';
import 'package:project/pages/workout_page.dart';

class BrowsePages extends StatelessWidget {
  const BrowsePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (builder)=>WorkoutPages(
                ),
                ),
              );
            },
            child: Text('Trainer Details',style: myStyle(22, Colors.white, FontWeight.bold),)),
        // actions: [
        //   Container(
        //       margin: EdgeInsets.only(right: 20),
        //       child: Text('Browse',style: myStyle(25, Colors.white, FontWeight.bold),))
        // ],
      ),

      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      color:primaryColor,

                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(image: AssetImage("${alltrainersdata[index].imgURL}"), fit: BoxFit.cover,)
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${alltrainersdata[index].trainer}", style: myStyle(17, Colors.white.withOpacity(0.7), FontWeight.bold),),
                                Text("${alltrainersdata[index].trainerName}", style: myStyle(18, Colors.white, FontWeight.bold),),
                                SizedBox(height: 40,),
                                Text("${alltrainersdata[index].workoutName}", style: myStyle(20, Colors.black, FontWeight.bold),),
                                Row(
                                  children: [
                                    Text("${alltrainersdata[index].rating}", style: myStyle(19, Colors.white.withOpacity(0.7), FontWeight.bold),),
                                    Icon(Icons.star, color: Colors.yellow,),
                                    Icon(Icons.star, color: Colors.yellow,),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
