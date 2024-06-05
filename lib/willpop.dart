// import 'package:flutter/material.dart';
// class willpop extends StatefulWidget {
//   const willpop({super.key});
//
//   @override
//   State<willpop> createState() => _willpopState();
// }
//
// class _willpopState extends State<willpop> {
//
//   DateTime backButton = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: ()async{
//         if(DateTime.now().difference(backButton)>=Duration(seconds: 2)){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Press back button again"),
//             duration: Duration(seconds: 2),
//           ));
//           backButton = DateTime.now();
//            return false;
//
//         }
//         else{
//          return true;}
//
//       },
//       child: Scaffold(
//         body: Center(child: Text("hello")),
//       ),
//     );
//   }
// }
