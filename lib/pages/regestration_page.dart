import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:project/data/registrationdata.dart';
import 'package:project/model/registrationModel.dart';
import 'package:project/pages/login_page.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Registration successful'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _Weight = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _Height = TextEditingController();
  TextEditingController _goal = TextEditingController();
  TextEditingController _Age = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Registration", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// First Name
                TextFormField(
                  controller: _firstName,
                  decoration: InputDecoration(
                    label: Text(" Name"),
                    hintText: " Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter first name";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// age
                TextFormField(
                  controller: _Age,
                  decoration: InputDecoration(
                    label: Text("Age"),
                    hintText: "Age",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Age";
                    }
                  },
                ),

                SizedBox(height: 30,),
                /// gender
                TextFormField(
                  controller: _gender,
                  decoration: InputDecoration(
                    label: Text("Gender"),
                    hintText: "Gender",
                    // hintStyle: TextStyle(color: Colors.purple)

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Gender";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Height
                TextFormField(
                  controller: _Height,
                  decoration: InputDecoration(
                    label: Text("Height"),
                    hintText: "Height",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Height";
                    }
                  },
                ),
                SizedBox(height: 30,),
                /// Weight
                TextFormField(
                  controller: _Weight,
                  decoration: InputDecoration(
                    label: Text(" Weight"),
                    hintText: "Weight",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Weight";
                    }
                  },
                ),
                SizedBox(height: 30,),
                /// Goal Weight
                TextFormField(
                  controller: _goal,
                  decoration: InputDecoration(
                    label: Text("Goal Weight"),
                    hintText: "Weight",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Weight";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Email
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter your email",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    suffix: Icon(Icons.email_outlined),
                    // suffixIcon: Icon(Icons.abc),
                    // prefix: Icon(Icons.abc),
                    // prefixIcon: Icon(Icons.abc)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    }
                    if (!value.contains("@")) {
                      return "Enter correct email";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Password
                TextFormField(
                  controller: _password,
                  obscureText: isObs,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter your password",
                    // hintStyle: TextStyle(color: Colors.purple)
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        isObs = !isObs;
                        setState(() {

                        });
                      },
                      icon:  Icon(Icons.visibility),
                    ),
                    // suffixIcon: Icon(Icons.abc),
                    // prefix: Icon(Icons.abc),
                    // prefixIcon: Icon(Icons.abc)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 digits/char";
                    }
                  },
                ),

                SizedBox(height: 30,),

                /// Re-password
                TextFormField(
                  controller: _rePassword,
                  obscureText: isObs,
                  decoration: customDecoration(
                      "Re enter the pass",
                      Icon(Icons.visibility)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    if (value != _password.text.toString()) {
                      return "Password does not match";
                    }
                  },
                ),
                Gap(25),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: primaryColor,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      user.add(
                        Registrationmodel(
                          firstName: _firstName.text.toString(),
                          email: _email.text.toString(),
                          password: _password.text.toString(),
                          height: _Height.text.toString(),
                          weight: _Weight.text.toString(),
                          goal: _goal.text.toString(),
                          gender: _gender.text.toString(),
                          age: _Age.text.toString(),
                        ),
                      );

                      _showSnackbar(context);

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => SignInPage()),
                      );
                    }
                  },
                  child: Text(
                    "Sign Up!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(20),
                Text('Sign up with  :', style: myStyle(15),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline_sharp, color: Colors.red,),),
                    Gap(15),
                    IconButton(onPressed: () {}, icon: Icon(Icons.facebook, color: Colors.blue,),),
                    Gap(15),
                    IconButton(onPressed: () {}, icon: Icon(Icons.telegram_outlined, color: Colors.blue,),),
                  ],
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customDecoration(String hint, Icon icon) {
    return InputDecoration(
      label: Text(hint),
      hintText: hint,
      // hintStyle: TextStyle(color: Colors.purple)
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      suffix: IconButton(
        onPressed: () {
          setState(() {
            isObs = !isObs;
          });
        },
        icon: icon,
      ),
    );
  }
}
