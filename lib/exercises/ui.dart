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

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List<ExerciseModel> exercises = <ExerciseModel>[];

  getExercises() async {
    String url =
        'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['exercises'].forEach((element) {
      ExerciseModel exerciseModel = ExerciseModel.fromMap(element);
      exercises.add(exerciseModel);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getExercises();
    });
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
              child: Text('Choose your Favorite Exercises',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 57, 94),
                      fontWeight: FontWeight.bold,
                      fontSize: 23)),
            ),
            Container(
                child: Expanded(
              child: GridView.count(
                  mainAxisSpacing: 0,
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  children: List.generate(exercises.length, (index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GridTile(
                            child: ExerciseDisplay(
                          title: exercises[index].title,
                          gif: exercises[index].gif,
                          seconds: exercises[index].seconds,
                        )),
                      ),
                    );
                  })),
            )),
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
