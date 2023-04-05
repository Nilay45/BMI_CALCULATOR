import 'package:bmi_calculator/Provider/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home_Ui_Page_02.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<DataProvider>(builder: (context, provider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          provider.setGender(true);
                },
                        child: Container(
                          height: 165,
                          decoration: BoxDecoration(
                            color: provider.Gender ? Color(0xFF232336) : Color(0xFF1D1E33),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.male,
                                color: Colors.white,
                                size: 90,),
                              SizedBox(height: 10),
                              Text("MALE",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          provider.setGender(false);
              },
                        child: Container(
                          height: 165,
                          decoration: BoxDecoration(
                              color: provider.Gender ? Color(0xFF1D1E33) : Color(0xFF232336),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.female,
                                color: Colors.white,
                                size: 90,),
                              SizedBox(height: 10),
                              Text("FEMALE",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
            Container(
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF232336),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("HEIGHT",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer<DataProvider>(builder: (context,provider,child){
                       return Text(provider.Hight.toString(),
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                       );
                      }),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Text("CM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<DataProvider>(builder: (context, provider, child){
                    return Slider(
                      activeColor: Color(0xFFca1b53),
                      inactiveColor: Colors.white,
                      value: provider.Hight.toDouble(),
                      min: provider.kminSliderHight,
                      max: provider.kmaxSliderHight,
                      onChanged: (double value){
                        provider.setHight(value.round());
                      },
                    );
                  }
                  ),
                  // Slider(value: value, onChanged: onChanged)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                        color: Color(0xFF232336),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("WEIGHT",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Consumer<DataProvider>(builder: (context,provider,child){
                          return Text(provider.Weight.toString(),
                              style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                          );
                        }),
                        Consumer<DataProvider>(builder: (context, provider, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    provider.setWeight(provider.Weight+1);
                                   // print(provider.Weight.toString());
                            },
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.add,
                                      color: Colors.blue,
                                      size: 45,),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    provider.setWeight(provider.Weight-1);
                                    //print(provider.Weight.toString());
                          },
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.remove,
                                      color: Colors.blue,
                                      size: 45,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                        color: Color(0xFF232336),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("AGE",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Consumer<DataProvider>(builder: (context,provider,child) {
                          return Text(provider.Age.toString(),
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }),
                        Consumer<DataProvider>(builder: (context,provider,child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    provider.setAge(provider.Age+1);
                            },
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.add,
                                      color: Colors.blue,
                                      size: 45,),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    provider.setAge(provider.Age-1);
                          },
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.remove,
                                      color: Colors.blue,
                                      size: 45,),

                                  ),
                                )
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>page_02()),
          );
        },
        child: Container(
          height: 75,
          decoration: const BoxDecoration(
              color: Color(0xFFca1b53)
          ),
          alignment: Alignment.center,
          child: const Text("CALCULATE",
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