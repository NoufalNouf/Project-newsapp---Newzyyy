
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newzy/phone%20verification.dart';

import 'package:newzy/projectlogin.dart';
import 'package:newzy/signup.dart';

import 'mainhomepage.dart';



class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {







  final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: "1036132992310-dk6ajjpru5k3gs2iblbvfrg9l2lkjrbd.apps.googleusercontent.com"
  );


  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
       Navigator.push(context, MaterialPageRoute(builder: (context)=> newe()));
      // Use the user object for further operations or navigate to a new screen.
    } catch (e) {
      print(e.toString());
    }

  }








  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
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
                    Container(
                      height: 500,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/globee.png"),
                                  fit: BoxFit.cover

                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Newzyyy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            "Your Source for Truthful Insights",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneNumber()));
                        },
                        leading: Icon(Icons.phone_android),
                        title: Text(
                          "Continue with phone number",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                        onTap: ()  {




                          signInWithGoogle();





                        },
                        leading: Container(
                            height: 28,
                            width: 28,
                            child: Image.asset("images/google.png")),
                        title: Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                           color: Colors.green.withOpacity(0.8),
                           borderRadius: BorderRadius.circular(30)),

                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => sign()),
                          );
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        )),

//
// Container(
//   height: 50,width: 50,
//   decoration: BoxDecoration(
//     border: Border.all(),
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       topRight: Radius.circular(20),
//     )
//   ),
// )


                  ],
                ),
              ),
            ),
          );
        });
  }
}
