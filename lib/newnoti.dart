// import 'package:flutter/material.dart';
//
// import 'newhome.dart';
//
// class newnoti extends StatefulWidget {
//
//
//
//   @override
//   State<newnoti> createState() => _newnotiState();
// }
//
// class _newnotiState extends State<newnoti> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     List data = [
//
//     dataModel("asdfghjkl;","asdfghjkl;'sdfghjkl;sdfghjk"),
//       dataModel("hh","hg"),
//
//
//         ];
//     super.initState();
//   }
//
//
//   late final List<dataModel> users;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Column(
//         children: [
//           Container(
//             height: 500,
//             child: ListView.builder(
//               itemCount: lis.length,
//               itemBuilder: (BuildContext c, index) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => newhome(names: lis[index],)),
//                         );
//                       },
//                       title: Text(
//                         lis[index].header,
//                         style: TextStyle(fontSize: 12),
//                       ),
//                       trailing: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           lis[index].image,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
// }
//
//
// class dataModel {
//   String header;
//   String image;
//
//   dataModel(this.header, this.image);
// }
//
// // List lis = data.map((e) => dataModel(e["header"], e["image"])).toList();
// //
//
//
//
//
