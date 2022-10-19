import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDisplay extends StatefulWidget {
  final String label, img, source, url;
  List<dynamic> dietLabels;

  RecipeDisplay({
    required this.dietLabels,
    required this.label,
    required this.img,
    required this.source,
    required this.url,
  });

  @override
  State<RecipeDisplay> createState() => _RecipeDisplayState();
}

class _RecipeDisplayState extends State<RecipeDisplay> {
  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.url);
            } else {
              print('no url');
            }
          },
          child: Container(
            height: 300,
            width: 200,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 210,
                      minWidth: 200,
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
                              widget.label,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 23, 24, 25),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.img),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: List.generate(
                                widget.dietLabels.length,
                                (i) {
                                  return Text(
                                    widget.dietLabels[i].toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 24, 25),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
