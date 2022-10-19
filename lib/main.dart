// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin.dart';
import 'create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int selectedindex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  List<Widget> _myPages = [
    _buildFirstPage(),
    _buildSecondPage(),
    _buildThirdPage()
  ];
  PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 236, 243),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          _buildAppBar(context),
          _middleScreen(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _middleScreen() {
    return SliverToBoxAdapter(
      child: Container(
        height: 2000,
        width: 2000,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              selectedindex = page;
            });
          },
          itemCount: _myPages.length,
          itemBuilder: (BuildContext context, selectedindex) {
            return selectedindex == 0
                ? _buildFirstPage()
                : (selectedindex == 1 ? _buildSecondPage() : _buildThirdPage());
          },
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      leading: null,
      leadingWidth: 0,
      elevation: 0,
      expandedHeight: 80,
      backgroundColor: Color.fromARGB(255, 224, 236, 243),
      flexibleSpace: FlexibleSpaceBar(
          title: Transform(
        transform: Matrix4.translationValues(14.0, 7, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 30, width: 30),
            Text(
              'EXCALIOR',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    color: Color.fromARGB(255, 9, 57, 94)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget _indicator(bool isActive) {
  return Container(
    height: 50,
    child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isActive ? Color.fromARGB(255, 175, 206, 230) : Colors.white)),
  );
}

class _buildFirstPage extends StatelessWidget {
  const _buildFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(37), topRight: Radius.circular(37)),
          color: Color.fromARGB(255, 224, 236, 243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'For all your diet and nutrition needs',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 9, 57, 94),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/1a.png',
                      width: 800, height: 330),
                ),
                Container(
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 26, 26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _indicator(true),
                            _indicator(false),
                            _indicator(false)
                          ],
                        ),
                        Container(
                          width: 330,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 175, 206, 230)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 27, 26, 26)),
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            },
                            child: const Text('Create an account',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 330,
                          height: 40,
                          child: OutlinedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            style: OutlinedButton.styleFrom(
                                primary: Color.fromARGB(255, 175, 206, 230),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 175, 206, 230))),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}

class _buildSecondPage extends StatelessWidget {
  const _buildSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(37), topRight: Radius.circular(37)),
          color: Color.fromARGB(255, 224, 236, 243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Find the perfect workout plan for you',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 9, 57, 94),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/1b.png',
                      width: 800, height: 330),
                ),
                Container(
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 26, 26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _indicator(false),
                            _indicator(true),
                            _indicator(false)
                          ],
                        ),
                        Container(
                          width: 330,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 175, 206, 230)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 27, 26, 26)),
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            },
                            child: const Text('Create an account',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 330,
                          height: 40,
                          child: OutlinedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            style: OutlinedButton.styleFrom(
                                primary: Color.fromARGB(255, 175, 206, 230),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 175, 206, 230))),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}

class _buildThirdPage extends StatelessWidget {
  const _buildThirdPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(37), topRight: Radius.circular(37)),
          color: Color.fromARGB(255, 224, 236, 243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Your companion in the jouney of self care',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 9, 57, 94),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/1c.png',
                      width: 800, height: 330),
                ),
                Container(
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 27, 26, 26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _indicator(false),
                            _indicator(false),
                            _indicator(true)
                          ],
                        ),
                        Container(
                          width: 330,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 175, 206, 230)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 27, 26, 26)),
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            },
                            child: const Text('Create an account',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 330,
                          height: 40,
                          child: OutlinedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            style: OutlinedButton.styleFrom(
                                primary: Color.fromARGB(255, 175, 206, 230),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 175, 206, 230))),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}
