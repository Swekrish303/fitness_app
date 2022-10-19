import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _myController = TextEditingController();
  final _myController2 = TextEditingController();
  final _myController3 = TextEditingController();
  final _myController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Start your Journey Today',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Color.fromARGB(255, 9, 57, 94)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 224, 236, 243),
      ),
      body: Container(
        color: const Color.fromARGB(255, 224, 236, 243),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/images/2a1.png',
                width: double.infinity, height: 250),
            Container(
              color: const Color.fromARGB(255, 224, 236, 243),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Container(
                      width: 330,
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: const Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController,
                        autofocus: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Color.fromARGB(255, 31, 31, 31),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 137, 130, 130))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 163, 156, 156))),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(255, 163, 156, 156),
                          ),
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 330,
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: const Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController2,
                        autofocus: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color.fromARGB(255, 31, 31, 31),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 137, 130, 130))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 163, 156, 156))),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(255, 163, 156, 156),
                          ),
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 330,
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: const Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController3,
                        autofocus: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Color.fromARGB(255, 31, 31, 31),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 137, 130, 130))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 163, 156, 156))),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(255, 163, 156, 156),
                          ),
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 330,
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: const Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController4,
                        autofocus: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Color.fromARGB(255, 31, 31, 31),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 137, 130, 130))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.6,
                                  color: Color.fromARGB(255, 163, 156, 156))),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(255, 163, 156, 156),
                          ),
                          hintText: 'Confirm Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 9, 57, 94)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _myController2.text,
                              password: _myController4.text,
                            );
                            try {
                              final db = FirebaseFirestore.instance;
                              final uid =
                                  await FirebaseAuth.instance.currentUser!.uid;

                              final userInfo = <String, dynamic>{
                                "uid":
                                    uid, // uid = FirebaseAuth.instance.currentUser
                                "username": _myController.text,
                                "workout1": '',
                                "workout2": '',
                                "workout3": '',
                                "workout4": '',
                                "workout5": '',
                                "workout6": '',
                                "workout7": '',
                                "workout8": '',
                                "workout9": '',
                                "workout10": '', // Get from input field
                              };

                              await db
                                  .collection("users")
                                  .doc(uid)
                                  .set(userInfo);
                            } catch (e) {
                              Text('Error storing data');
                            }
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                content: Container(
                                    height: 50,
                                    width: 330,
                                    color:
                                        const Color.fromARGB(255, 77, 114, 143),
                                    child: e.code == 'weak-password'
                                        ? const Center(
                                            child: Text(
                                              'Password is too weak',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : (e.code == 'email-already-in-use'
                                            ? const Center(
                                                child: Text(
                                                  'Email already in use',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            : Text(e.code.toString()))),
                              ),
                            );
                          }
                        },
                        child: const Text('SIGN UP'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 57, 94),
                            fontSize: 16.2),
                      ),
                      TextButton(
                        child: const Text('Sign in',
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 57, 94),
                                fontSize: 16.2,
                                fontWeight: FontWeight.w600)),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          );
                        },
                      )
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
