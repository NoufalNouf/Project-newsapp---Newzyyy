import 'package:flutter/material.dart';
import 'package:newzy/projectloginpage.dart';


import 'mailauthentication.dart';
import 'mainhomepage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();

  final a = GlobalKey<FormState>();

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
          title: Text("Login "
              "",style: TextStyle(fontSize: 15),),
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
                key: a,
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
                          "   Email or username",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: mail,
                            style: TextStyle(fontSize: 15),
                            validator: (value) {
                              if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value!) ||
                                  value.isEmpty) return ("Enter valid email id");
                            },
                            decoration: InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),

                        Text(
                          "   Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: pass,
                            style: TextStyle(fontSize: 15),
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length <= 7)
                                return ("The password must be atleast 8 charecters long");
                            },
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                border: OutlineInputBorder()),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        final message = await AuthService().login(
                          email: mail.text,
                          password: pass.text,
                        );

                        if (a.currentState!.validate()) {
                          if (message!.contains('Success')) {
                            print(message);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => newe()),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Successfully logged in"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "No account found with that email and password"),
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
