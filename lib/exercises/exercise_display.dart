import 'package:fitness_app/exercises/individual.dart';
import 'package:fitness_app/exercises/individual_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseDisplay extends StatefulWidget {
  final String title, gif, seconds;

  ExerciseDisplay({
    required this.title,
    required this.gif,
    required this.seconds,
  });

  @override
  State<ExerciseDisplay> createState() => _ExerciseDisplayState();
}

class _ExerciseDisplayState extends State<ExerciseDisplay> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 110,
                    minWidth: 350,
                  ),
                  child: Card(
                    semanticContainer: true,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromARGB(255, 244, 245, 247),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Color.fromARGB(255, 23, 24, 25),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                widget.seconds + ' seconds',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 57, 94),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: 150),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndividualScreen(
                                          title: widget.title,
                                          gif: widget.gif,
                                          seconds: widget.seconds)),
                                );
                              },
                              child: Icon(Icons.arrow_circle_right_rounded,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExerciseHomeDisplay extends StatefulWidget {
  final String title, gif, seconds;

  ExerciseHomeDisplay({
    required this.title,
    required this.gif,
    required this.seconds,
  });

  @override
  State<ExerciseHomeDisplay> createState() => _ExerciseHomeDisplayState();
}

class _ExerciseHomeDisplayState extends State<ExerciseHomeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 110,
                    minWidth: 350,
                  ),
                  child: Card(
                    semanticContainer: true,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromARGB(255, 244, 245, 247),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Color.fromARGB(255, 23, 24, 25),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                widget.seconds + ' seconds',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 57, 94),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: 150),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          IndividualHomeScreen(
                                              title: widget.title,
                                              gif: widget.gif,
                                              seconds: widget.seconds)),
                                );
                              },
                              child: Icon(Icons.arrow_circle_right_rounded,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
