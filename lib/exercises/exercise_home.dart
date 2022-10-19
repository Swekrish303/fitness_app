import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/exercises/exercise_choice.dart';
import 'package:fitness_app/exercises/exercise_display.dart';
import 'package:fitness_app/exercises/exercise_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';

class ExerciseHomeScreen extends StatefulWidget {
  const ExerciseHomeScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseHomeScreen> createState() => _ExerciseHomeScreenState();
}

class _ExerciseHomeScreenState extends State<ExerciseHomeScreen> {
  List<ExerciseModel> exercises = <ExerciseModel>[];
  List<ExerciseModel> yourCircuit = <ExerciseModel>[];
  bool _toggle = false;

  getExercises() async {
    final db = FirebaseFirestore.instance;
    final uid = await FirebaseAuth.instance.currentUser!.uid;
    final userInfo = await db.collection("users").doc(uid).get();
    final user = userInfo.data() as Map<String, dynamic>;
    String url =
        'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['exercises'].forEach((element) {
      ExerciseModel exerciseModel = ExerciseModel.fromMap(element);
      exercises.add(exerciseModel);
      int j;
      for (j = 1; j <= 10; j++) {
        if (exerciseModel.gif == (user['workout$j'].toString())) {
          yourCircuit.add(exerciseModel);
        }
      }
    });
    setState(() {
      _toggle = true;
    });
  }

  @override
  void initState() {
    getExercises();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 232, 234, 238),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Your Circuit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 57, 94),
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),
            ),
            _toggle == true
                ? Container(
                    child: Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 0,
                        crossAxisCount: 1,
                        childAspectRatio: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        children: List.generate(yourCircuit.length, (index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GridTile(
                                  child: ExerciseHomeDisplay(
                                title: yourCircuit[index].title,
                                gif: yourCircuit[index].gif,
                                seconds: yourCircuit[index].seconds,
                              )),
                            ),
                          );
                        })),
                  ))
                : Container(),
          ],
        ),
      ),
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
            MaterialPageRoute(
                builder: (context) => const ExerciseChoiceScreen()),
          );
        }),
      ),
    );
  }
}
