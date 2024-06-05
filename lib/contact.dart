import 'package:flutter/material.dart';

class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Text("Have questions, feedback, or suggestions? We'd love to hear from you! Feel free to reach out to us at \n\nMail : noufalnoufal44330@gmail.com or \n\nPhone : 8148000623 \n\nand our team will be happy to assist you."),

    );
  }
}
