// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:newzyyy/mainhomepage.dart';
//
//
// class log extends StatefulWidget {
//   const log({super.key});
//
//   @override
//   State<log> createState() => _logState();
// }
//
// class _logState extends State<log> {
//   final GoogleSignIn googleSignIn = GoogleSignIn(
//       clientId: '454241743320-qi7j10ec95d9sovlcom9iskegaptubk2.apps.googleusercontent.com'
//   );
//
//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       final User? user = userCredential.user;
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> newe()));
//       // Use the user object for further operations or navigate to a new screen.
//     } catch (e) {
//       print(e.toString());
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: ()
//             async {
//               signInWithGoogle();
//             }, child: Text('Google signin'))
//           ],
//         ),
//       ),
//     );
//   }
// }