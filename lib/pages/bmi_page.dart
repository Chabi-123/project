import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = "";

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _bmiResult = "Your BMI is ${bmi.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        _bmiResult = "Please enter valid values";
      });
    }
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
        backgroundColor:primaryColor,
        title: Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height in meters',
                ),
              ),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight in kg',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Calculate BMI',style: myStyle(18,),),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                     _bmiResult,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                color: Colors.blueGrey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Below 18.5	        Underweight',style: myStyle(18,Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('18.5—24.9          Healthy Weight',style: myStyle(18,Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('25.0—29.9	         Overweight',style: myStyle(18,Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Below 18.5	        Underweight',style: myStyle(18,Colors.white),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('30.0                        and Above	Obesity',style: myStyle(18,Colors.white),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
