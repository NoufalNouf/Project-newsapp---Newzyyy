import 'package:flutter/material.dart';

class privacy extends StatefulWidget {
  const privacy({super.key});

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold),),


        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Colors.blue, Colors.white],
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter),
        //   ),
        // ),
      ),


      body: Text("Protecting your privacy is important to us. For information about how we collect, use, and safeguard your data, please refer to our Privacy Policy [insert link to Privacy Policy]."),


    );
  }
}
