import 'package:fitness_app/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create_account.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _myController = TextEditingController();
  final _myController2 = TextEditingController();

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
          'Welcome Back',
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
            const SizedBox(height: 70),
            Image.asset('assets/images/2a2.png',
                width: double.infinity, height: 280),
            const Text(
              'We missed you!',
              style: TextStyle(
                  color: Color.fromARGB(255, 9, 57, 94),
                  fontSize: 18.5,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              color: const Color.fromARGB(255, 224, 236, 243),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Container(
                      width: 330,
                      height: 50,
                      child: TextFormField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController,
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
                        cursorColor: Color.fromARGB(255, 31, 31, 31),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _myController2,
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
                    const SizedBox(height: 80),
                    Container(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 9, 57, 94)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _myController.text,
                              password: _myController2.text,
                            );
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                behavior: SnackBarBehavior.floating,
                                content: Container(
                                    height: 50,
                                    width: 330,
                                    color: Color.fromARGB(255, 77, 114, 143),
                                    child: e.code == 'user-not-found'
                                        ? const Center(
                                            child: Text(
                                              'User not found for this email',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : (e.code == 'wrong-password'
                                            ? const Center(
                                                child: Text(
                                                  'Incorrect password',
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
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        'New to Excalior?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 57, 94),
                            fontSize: 16.2),
                      ),
                      TextButton(
                        child: const Text('Sign up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 57, 94),
                                fontSize: 16.2,
                                fontWeight: FontWeight.w600)),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()),
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
