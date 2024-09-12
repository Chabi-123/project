import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/fullbody_data.dart';
import 'package:project/data/man_data.dart';
import 'package:project/data/yoga_data.dart';
import 'package:project/model/fullbody_model.dart';
import 'package:project/pages/cycling_pages.dart';
import 'package:project/pages/yoga_page.dart';
class FullBodyPages extends StatefulWidget {
  const FullBodyPages({super.key});

  @override
  State<FullBodyPages> createState() => _FullBodyPagesState();
}

class _FullBodyPagesState extends State<FullBodyPages> {

  TextEditingController _controller = TextEditingController();
  List<FullbodyModel> _filteredDocs = allpics;

  void _filterDocs(String query) {
    List<FullbodyModel> result = [];
    if (query.isEmpty) {
      result = allpics;
    } else {
      result = allpics
          .where((docs) =>
          docs.rating.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredDocs = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Full Body", style: myStyle(25, Colors.white, FontWeight.bold),),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              image: DecorationImage(image: AssetImage("assets/images/img1.jpg"), fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Good Morning", style: myStyle(13, primaryColor, FontWeight.bold),),
                              Text("Rigyel Wangmo", style: myStyle(18, primaryColor, FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite_border, color: Colors.black,size: 30,),
                          SizedBox(width: 10,),
                          Icon(Icons.notifications_active_outlined, color: Colors.black,size: 30,),
                        ],
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search exercise, courses, etc...',
                    prefixIcon: Icon(Icons.search_sharp, size: 30,),
                    suffixIcon: Icon(Icons.keyboard_voice,size: 30,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value){
                    _filterDocs(value);
                  },
                ),
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Today WorkOut Plan", style: myStyle(18, primaryColor, FontWeight.bold),)
                    ],
                  ), Column(
                    children: [
                      Text("6am-8am",style: myStyle(18, primaryColor, FontWeight.bold))
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allpics.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder)=>Yogapagesview(
                              yogaDetailsModel: alltexts[index]
                          ),
                          ),
                        );
                      },

                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("${allpics[index].imgURL}"),fit: BoxFit.cover),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue.withOpacity(0.4)
                                    ),
                                    child: Center(
                                        child: Text("${allpics[index].name}", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Categories",style: myStyle(20, primaryColor, FontWeight.bold),)
                    ],
                  ),Column(
                    children: [
                      Text("See all",style: myStyle(18, primaryColor, ),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16,),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allmendata.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder)=>CyclingPages(
                            yogaDetailsModel: allcyclingPages[index]
                        ),
                        ),
                      );
                    },

                    child: Card(
                      elevation: 4,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("${allmendata[index].imgURL}"),fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                height: 40,
                                width: 135,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.withOpacity(0.2)
                                ),
                                child: Text("${allmendata[index].name}", style: myStyle(23, Colors.black, FontWeight.bold), textAlign: TextAlign.center,)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
