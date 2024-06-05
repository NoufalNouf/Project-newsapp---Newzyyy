import 'package:flutter/material.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),

        body: Column(
          children: [
            ListTile(
              title: Text("English"),
              trailing: Icon(Icons.check_box),

            ),

            Divider(
              thickness: 1,
            ),

            ListTile(
              title: Text("Tamil"),

            ),

            Divider(
              thickness: 1,
            )
          ],
        ),





      ),
    );
  }
}
