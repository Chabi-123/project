import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _SignInPageState();
}

class _SignInPageState extends State<ForgottenPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Forgot Password",style: myStyle(22,Colors.white,FontWeight.bold),),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 70 ,
                  backgroundImage: AssetImage('assets/images/password_Image.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("No worries, we'll send you reset instructions.",style: myStyle(17,Colors.black),),
                SizedBox(height: 20,),
                /// First Name
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    label: Text("Email",style: myStyle(18),),
                    hintText: "Email",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter email";
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  child: Center(child: Text('Reset password',style: myStyle(22,Colors.white),)),
                ),
                SizedBox(height: 15,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
