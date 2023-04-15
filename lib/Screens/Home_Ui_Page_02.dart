import 'package:flutter/material.dart';
import 'package:bmi_calculator/Provider/data.dart';
import 'package:provider/provider.dart';

class page_02 extends StatelessWidget {
  const page_02({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1011428),
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xFF101428),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Result",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF232336),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Consumer<DataProvider>(builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(provider.intro().toString(),
                        style: const TextStyle(
                          color: Color(0xFF2323336),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(provider.calculateBMI().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 90,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(provider.msg().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: 75,
          decoration: const BoxDecoration(
              color: Color(0xFFca1b53)
          ),
          alignment: Alignment.center,
          child: const Text("RE-CALCULATE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
