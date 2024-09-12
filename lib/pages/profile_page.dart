import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/registrationdata.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? _image;

  Future imageFromGallery()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  Future imageFromCamara()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context){
              return Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){
                      imageFromCamara();
                      Navigator.pop(context);
                    }, icon: Icon(Icons.camera_alt),),

                    IconButton(onPressed: (){
                      imageFromGallery();
                      Navigator.pop(context);
                    }, icon: Icon(Icons.image))

                  ],
                ),
              );
            },
          );
        },
      ),
      appBar: AppBar(

          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor:primaryColor,
          title: Text('User Profile',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
                child: _image != null ? CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: FileImage(_image!),
                ) : Text('Select an Image')
            ),
            SizedBox(height: 10),
            Text(
              '${user[0].firstName}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${user[0].email}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}