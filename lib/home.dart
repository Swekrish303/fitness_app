import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/exercises/exercise_choice.dart';
import 'package:fitness_app/exercises/exercise_home.dart';
import 'package:fitness_app/exercises/ui.dart';
import 'package:fitness_app/recipes/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin.dart';
import 'create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _userName;
  Future<void> getUserName() async {
    final db = FirebaseFirestore.instance;
    final uid = await FirebaseAuth.instance.currentUser!.uid;
    final userInfo = await db.collection("users").doc(uid).get();
    final userData = userInfo.data() as Map<String, dynamic>;
    setState(() {
      _userName = userData['username'].toString();
    });
  }

  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Card(
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
                              image: AssetImage('assets/images/h1.png'),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                        const Text(
                          "Exercises for you",
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 57, 94),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 17),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ExerciseChoiceScreen()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.sports_gymnastics_rounded,
                                  color: Color.fromARGB(
                                      255, 9, 57, 94)), // <-- Icon
                              Text("Try",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 9, 57, 94),
                                      fontWeight: FontWeight.bold)), // <-- Text
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
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
                              image: AssetImage('assets/images/h2.png'),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                        ),
                        const Text(
                          "Recipes for you",
                          style: TextStyle(
                              color: Color.fromARGB(255, 93, 19, 49),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 17),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecipeScreen()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.food_bank_rounded,
                                color: Color.fromARGB(255, 93, 19, 49),
                              ), // <-- Icon
                              Text("Try",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 93, 19, 49),
                                      fontWeight: FontWeight.bold)), // <-- Text
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
