import 'package:flutter/material.dart';

class noti extends StatefulWidget {
  const noti({super.key});

  @override
  State<noti> createState() => _notiState();
}

class _notiState extends State<noti> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          
        ),

        body: ListTile(
          title: Text("Notification"),
          trailing: Icon(Icons.notifications_none_outlined),
        ),


      ),
    );
  }
}
