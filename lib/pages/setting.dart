import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/pages/fitnessInformation.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/regestration_page.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({super.key});

  @override
  State<SettingPages> createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  bool _darkmood = false;

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Setting", style: myStyle(25, Colors.white, FontWeight.bold)),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcce3de).withOpacity(0.6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account Settings", style: myStyle(22, Colors.black, FontWeight.bold)),
                        Gap(15),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (builder) => ProfilePage()),
                            );
                          },
                          child: Text("Profile Information", style: myStyle(19, Colors.black, FontWeight.bold)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Change your Personal Information", style: myStyle(16, Colors.black.withOpacity(0.6))),
                            Icon(Icons.arrow_forward_ios, size: 20),
                          ],
                        ),
                        Gap(40),
                        InkWell(
                          onTap: () {
                            _showSnackbar(context, "Your Acc has been deleted");
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Registration()),
                                  (route) => false,
                              // This will remove all previous routes
                            );

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Delete Account", style: myStyle(19, Colors.black, FontWeight.bold)),
                                  Text("Delete your current Account", style: myStyle(16, Colors.black.withOpacity(0.6))),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, size: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcce3de).withOpacity(0.6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fitness Information", style: myStyle(22, Colors.black, FontWeight.bold)),
                        Gap(30),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (builder) => FitnessInformation()),
                            );
                          },
                          child: Text("Fitness Preferences", style: myStyle(19, Colors.black, FontWeight.bold)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (builder) => FitnessInformation()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Update your height, weight, fitness info", style: myStyle(16, Colors.black.withOpacity(0.6))),
                              Icon(Icons.arrow_forward_ios, size: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcce3de).withOpacity(0.6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Theme", style: myStyle(22, Colors.black, FontWeight.bold)),
                        Gap(30),
                        Text("Dark Theme", style: myStyle(19, Colors.black, FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Change your theme to Dark/Light", style: myStyle(16, Colors.black.withOpacity(0.6))),
                            Switch(
                              value: _darkmood,
                              onChanged: (bool value) {
                                setState(() {
                                  _darkmood = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(15),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      _showSnackbar(context, "You are logged out");
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignInPage()),
                            (route) => false,
                        // This will remove all previous routes
                      );

                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffcce3de).withOpacity(0.6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Log Out", style: myStyle(20, Colors.black, FontWeight.bold)),
                          SizedBox(width: 20),
                          Icon(Icons.logout, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
