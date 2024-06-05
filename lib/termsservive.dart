import 'package:flutter/material.dart';

class terms extends StatefulWidget {
  const terms({super.key});

  @override
  State<terms> createState() => _termsState();
}

class _termsState extends State<terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Service",style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Text("By using 'NEWZYYY', you agree to abide by our Terms of Service. For details about our terms and conditions of use, please visit '[insert link to Terms of Service]'."),

    );
  }
}
