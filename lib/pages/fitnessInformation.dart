import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/registrationdata.dart';
import 'package:project/pages/profile_page.dart';

class FitnessInformation extends StatefulWidget {
  const FitnessInformation({super.key});

  @override
  State<FitnessInformation> createState() => _FitnessInformationState();
}

class _FitnessInformationState extends State<FitnessInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text("Fitness Preferences", style: myStyle(25, Colors.white,FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Weight", style: myStyle(25, Colors.black, FontWeight.bold,)),
                  Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey.withOpacity(0.4)
                      ),
                      child: Center(child: Text("Save Changes",style: myStyle(18, Colors.black),)))
                ],
              ),
              Column(
                children: [

                  ProfileStat(
                    icon: Icons.apps_outage,
                    label: 'Age',
                    value: '${user[0].age}',
                  ),
                  ProfileStat(
                    icon: Icons.height,
                    label: 'Height',
                    value: '${user[0].height}',
                  ),
                  ProfileStat(
                    icon: Icons.monitor_weight_outlined,
                    label: 'Weight',
                    value: '${user[0].weight}',
                  ),
                  ProfileStat(
                    icon: Icons.monitor_weight_outlined,
                    label: 'Goal Weight',
                    value: '${user[0].goal}',
                  ),
                  ProfileStat(
                    icon: Icons.male_sharp,
                    label: 'Gender',
                    value: '${user[0].gender}',
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






