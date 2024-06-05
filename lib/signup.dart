import 'package:flutter/material.dart';
import 'package:newzy/projectloginpage.dart';

import 'mailauthentication.dart';
import 'mainhomepage.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final nou = GlobalKey<FormState>();

  final TextEditingController nouf = TextEditingController();
  final TextEditingController nouf1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.blue.withOpacity(0.6),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              icon: Icon(Icons.arrow_back)),
          title: Text("Create new account",style: TextStyle(fontSize: 15),),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg news.jpg"),
                fit: BoxFit.cover,colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), // Adjust the opacity for the shading effect
                BlendMode.lighten, // Change blend mode if needed
              ),
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Form(
                key: nou,
                child: Center(
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "   Enter email address",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value!) ||
                                  value.isEmpty) return ("Enter valid email id");
                            },
                            controller: nouf,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Text(
                          "   Create a password",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length <= 7)
                                return ("The password must be atleast 8 charecters long");
                            },
                            controller: nouf1,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Center(
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () async {
                      final message = await AuthService().registration(
                        email: nouf.text,
                        password: nouf1.text,
                      );

                      if (nou.currentState!.validate()) {
                        if (message!.contains('Success')) {
                          print(message);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => newe()),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Account Created Successfully"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                              Text("Mail ID and Password already exist"),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
