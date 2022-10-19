import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/recipes/recipe_display.dart';
import 'package:fitness_app/recipes/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<RecipeModel> recipes = <RecipeModel>[];
  String app_id = '2bc94af5';
  String app_key = '23a2164bb46fe097d7de36936aa322fc';
  bool _loading = false;
  bool _apiDone = false;

  getRecipes(String query) async {
    String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=2bc94af5&app_key=23a2164bb46fe097d7de36936aa322fc';

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['hits'].forEach((element) {
      RecipeModel recipeModel = RecipeModel.fromMap(element['recipe']);
      recipes.add(recipeModel);
    });
    setState(() {
      _apiDone = true;
      _loading = false;
    });
  }

  TextEditingController textEditingController = new TextEditingController();

  @override
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
            child: Text(
                'Find recipes and nutrition facts for your favorite ingredients',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 9, 57, 94),
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Container(
            padding: EdgeInsets.all(26),
            height: 100,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.black,
                    controller: textEditingController,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 29, 29, 29),
                        fontFamily: 'Overpass'),
                    decoration: InputDecoration(
                      hintText: "Enter Ingredient",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color:
                              Color.fromARGB(255, 70, 69, 69).withOpacity(0.5),
                          fontFamily: 'Overpass'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 29, 29, 29)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 29, 29, 29), width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    if (textEditingController.text.isNotEmpty) {
                      setState(() {
                        _loading = true;
                        _apiDone = false;
                      });
                      recipes = [];
                      getRecipes(textEditingController.text);
                      print("doing it");
                    } else {
                      print("not doing it");
                    }
                  },
                  child: const Icon(
                    Icons.search,
                    size: 24,
                    color: Color.fromARGB(255, 29, 29, 29),
                  ),
                ),
              ],
            ),
          ),
          _apiDone == false
              ? Container(child: Image.asset('assets/images/loading.png'))
              : Container(
                  child: Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        children: List.generate(recipes.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GridTile(
                                child: RecipeDisplay(
                              label: recipes[index].label,
                              img: recipes[index].image,
                              source: recipes[index].source,
                              url: recipes[index].url,
                              dietLabels: recipes[index].dietLabels,
                            )),
                          );
                        })),
                  ),
                ),
        ],
      )),
    );
  }
}
