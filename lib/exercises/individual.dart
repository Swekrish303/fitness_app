import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/exercises/ui.dart';
import 'package:fitness_app/recipes/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class IndividualScreen extends StatefulWidget {
  final String title, gif, seconds;

  IndividualScreen({
    required this.title,
    required this.gif,
    required this.seconds,
  });

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 27, 26, 26),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 253, 253, 255),
              fontWeight: FontWeight.w800,
              fontSize: 23,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Image.network(
              widget.gif,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              widget.seconds + ' seconds',
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 57, 94),
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 330,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 9, 57, 94)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () async {
                  final db = FirebaseFirestore.instance;
                  final uid = await FirebaseAuth.instance.currentUser!.uid;
                  final userInfo = await db.collection("users").doc(uid).get();
                  final user = userInfo.data() as Map<String, dynamic>;
                  var userData = await db.collection("users").doc(uid);
                  int i;
                  for (i = 1; i <= 10; i++) {
                    var user1 = user['workout$i'].toString();
                    if (user1 == '') {
                      break;
                    }
                  }
                  userData.update({'workout$i': widget.gif});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExerciseScreen()),
                  );
                },
                child: const Text('ADD TO CIRCUIT',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ));
  }
}
