import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;
  String gender = '';

  late double bmi = calculatebmi(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //print("Male");
                        setState(() {
                          gender = 'M';
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                          color: gender == 'M'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Column(
                          children: [
                            Icon(Icons.male, size: 150),
                            Text("Male"),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        //print("Female");
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                          color: gender == 'F'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Column(
                          children: [
                            Icon(Icons.female, size: 150),
                            Text("Female"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Height"),
                          Text(
                            "$height",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (height > 50) height--;
                                      bmi = calculatebmi(
                                          height: height, weight: weight);
                                    },
                                  );
                                },
                                backgroundColor: Colors.blueAccent,
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 25),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (height < 220) height++;
                                      bmi = calculatebmi(
                                          height: height, weight: weight);
                                    },
                                  );
                                },
                                backgroundColor: Colors.blueAccent,
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Weight"),
                          Text(
                            "$weight",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (weight > 35) weight--;
                                      bmi = calculatebmi(
                                          height: height, weight: weight);
                                    },
                                  );
                                },
                                backgroundColor: Colors.blueAccent,
                                child: const Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 25),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (weight < 300) weight++;
                                      bmi = calculatebmi(
                                          height: height, weight: weight);
                                    },
                                  );
                                },
                                backgroundColor: Colors.blueAccent,
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    const Text("BMI"),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: kInputLabelColor.copyWith(
                          color: kOutTextColor, fontSize: 60),
                    ),
                    Text(
                      getResult(bmi),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculatebmi({required height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else if (bmiValue > 18.5) {
      return 'Healthy Weight';
    } else {
      return 'Underweight';
    }
  }
}
