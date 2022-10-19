import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/exercises/exercise_home.dart';
import 'package:fitness_app/exercises/ui.dart';
import 'package:fitness_app/home.dart';
import 'package:fitness_app/recipes/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class ExerciseChoiceScreen extends StatefulWidget {
  const ExerciseChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseChoiceScreen> createState() => _ExerciseChoiceState();
}

class _ExerciseChoiceState extends State<ExerciseChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: 4000,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            color: Color.fromARGB(255, 232, 234, 238),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseHomeScreen()),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromARGB(255, 244, 245, 247),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 330,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/physicalhealth.png'),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Your Circuit",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 57, 94),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseScreen()),
                        );
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromARGB(255, 244, 245, 247),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 330,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/2c.png'),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                            ),
                            SizedBox(height: 40),
                            const Text(
                              "Explore other Exercises",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 57, 94),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 9, 57, 94),
        child: Icon(
          Icons.arrow_back_rounded,
          color: Color.fromARGB(255, 175, 199, 217),
          size: 22,
        ),
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }),
      ),
    );
  }
}
