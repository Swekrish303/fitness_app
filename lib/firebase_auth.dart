import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/userentity.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserEntity?> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

@override
Future<UserEntity?> createUserWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
