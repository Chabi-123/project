import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/menu_data.dart';
import 'package:project/pages/bmi_page.dart';
import 'package:project/pages/dite_page.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/schedule_page.dart';
import 'package:project/pages/setting.dart';
import 'package:project/pages/tips_page.dart';
import 'package:project/pages/workout_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  double _currentValue = 0;
  List listPages = [
    BMICalculator(),
    CaloriesHome(),
    ScheduleScreen(),
    WorkoutPages(),
    TipsFitness(),
    SettingPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(left: 80,right: 80,top: 15,bottom: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/strong-man.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage('assets/images/profile.png')),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                )
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPages()),
                  ); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb),
                title: Text(
                  'Tips',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TipsFitness()),
                  ); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => ProfilePage())); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text(
                  'BMI',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => BMICalculator())); // Close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.workspaces_rounded),
                title: Text(
                  'Work Out',
                  style: myStyle(18, primaryColor, FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => WorkoutPages())); // Close the drawer
                },
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: primaryColor,
              expandedHeight: 130.0,
              iconTheme: IconThemeData(color: Colors.white),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "F I T N E S S",
                  style: myStyle(18, Colors.white, FontWeight.bold),
                ),
                background: Image.asset(
                  'assets/images/man-holding-a-dumbbell.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(10),
                        Text('"Sweat Hard, Stay Cool!"',style: myStyle(22,Colors.black),),
                        Gap(10),
                        Card(
                          elevation: 3,
                          shadowColor: Colors.white,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.42,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/strong-man.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Current Workout Plan',
                                        style: myStyle(17, primaryColor),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (builder) => WorkoutPages()));
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'See all Details  ',
                                              style: myStyle(13, primaryColor),
                                            ),
                                            Icon(
                                              Icons.read_more,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Body weight Program',
                                        style: myStyle(15, primaryColor),
                                      ),
                                      Text(
                                        '0%',
                                        style: myStyle(15, primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Slider(
                                  activeColor: primaryColor,
                                    value: _currentValue,
                                    max: 100,
                                    // divisions: 5,
                                    onChanged: (double val){
                                      setState(() {_currentValue = val;
                                      }
                                      );
                                    }
                                ),
                              ],
                            ),
                          ),
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.85,
                          ),
                          shrinkWrap: true,
                          itemCount: alldata.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => listPages[index]));
                              },
                              child: Card(
                                margin: EdgeInsets.all(7),
                                color: Colors.white,
                                shadowColor: Colors.white,
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      height: 85,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${alldata[index].imgUrl}'))),
                                    ),
                                    Text(
                                      '${alldata[index].name}',
                                      style: myStyle(
                                          18, Colors.blueGrey, FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
