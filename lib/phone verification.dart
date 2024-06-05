// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:newzy/otp%20verifiction.dart';
//
// class phone extends StatefulWidget {
//   const phone({super.key});
//
//   @override
//   State<phone> createState() => _phoneState();
// }
//
// class _phoneState extends State<phone> {
//
//   TextEditingController phone = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         // crossAxisAlignment: CrossAxisAlignment.,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Center(
//             child: TextFormField(
//               controller: phone,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//
//
//
//           ElevatedButton(onPressed: () async
//           {
//             await FirebaseAuth.instance.verifyPhoneNumber(
//                 verificationCompleted: (PhoneAuthCredential credential){},
//                 verificationFailed: (FirebaseAuthException fail){print("verification failed : $fail");},
//                 codeSent: (String VerificatinID, int? resendToken)
//                 {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>otp(VerificationId: VerificatinID,)));
//                 },
//                 codeAutoRetrievalTimeout: (String VerificationID){},
//               phoneNumber: phone.text.toString(),
//
//     );
//             },
//               child: Text("Verify Phone Number"))
//
//         ],
//       ),
//     );
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzy/projectloginpage.dart';

import 'otp verifiction.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final phoneController = TextEditingController();

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
          title: Text("Phone Number Verification",style: TextStyle(fontSize: 15),),
        ),
        body: Container(
          decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("images/bg news.jpg"),
               fit: BoxFit.cover,colorFilter: ColorFilter.mode(
               Colors.white.withOpacity(0.4), // Adjust the opacity for the shading effect
               BlendMode.lighten, // Change blend mode if needed
             ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 200,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "+91 __ __ __ __ __ __ __ __ __",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Phone number should start with  +91",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException ex) {
                  //     print('Verification failed: $ex');
                  //   },
                  //   codeSent: (String verificationId, int? resendToken) {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => OtpScreen(verificationid: verificationId),
                  //       ),
                  //     );
                  //   },
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  //   phoneNumber: phoneController.text.toString(),
                  // );
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (PhoneAuthCredential credential){},
                      verificationFailed: (FirebaseAuthException fail){
                        print("Verification failed : $fail");
                      },
                      codeSent: (String verificationId, int? resendToken){},
                      codeAutoRetrievalTimeout: ( String verificationId){}
                  );
                },
                child: Text("Send OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}