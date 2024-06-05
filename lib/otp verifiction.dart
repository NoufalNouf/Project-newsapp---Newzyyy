// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:newzy/mainhomepage.dart';
//
// class otp extends StatefulWidget {
//   final String VerificationId;
//    otp({super.key, required this.VerificationId});
//
//   @override
//   State<otp> createState() => _otpState();
// }
//
// class _otpState extends State<otp> {
//
//   // TextEditingController otpFill = TextEditingController();
//   final  otpFill = List.generate(6, (index)=> TextEditingController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: List.generate(6, (index)=> otpVerify(context,index))
//          ),
//           ElevatedButton(
//             onPressed: () async {
//               try {
//                 String otp = otpFill.map((controller) => controller.text).join();
//                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                   verificationId: widget.VerificationId,
//                   smsCode:otp,
//                 );
//                 await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const newe()));
//                 });
//               } catch (ex) {
//                 log(ex.toString());
//               }
//             },
//             child: Text("Verify OTP"),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
//
// Widget otpVerify(BuildContext context, int index){
//   var otpFill;
//   return
//       Form(
//         child: Container(
//           height: 30,
//           width: 30,
//           child: TextFormField(
//             controller: otpFill[index] ,
//             onChanged: (value){
//               if (value.length==1){
//                 FocusScope.of(context).nextFocus();
//               }
//             },
//
//             style: Theme.of(context).textTheme.headlineSmall,
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(1),
//               FilteringTextInputFormatter.digitsOnly,
//             ],
//             decoration: InputDecoration(
//               hintText: '*',
//               border: OutlineInputBorder()
//             ),
//
//           ),
//         ),
//       );
// }








import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newzy/mainhomepage.dart';
import 'package:newzy/phone%20verification.dart';


class OtpScreen extends StatefulWidget {
  final String verificationid;
  OtpScreen({super.key, required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue.withOpacity(0.6),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => PhoneNumber()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("OTP Verification",style: TextStyle(fontSize: 15),),
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
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) => otpTextField(context, index)),
              ),
              SizedBox(height: 40,),

              ElevatedButton(
                onPressed: () async {
                  try {
                    String otp = otpControllers.map((controller) => controller.text).join();
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode:otp,
                    );
                    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  newe()));
                    });
                  } catch (ex) {
                    log(ex.toString());
                  }
                },
                child: Text("Verify OTP"),
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget otpTextField(BuildContext context,int index) {
    return Form(
      child: SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: otpControllers[index],
            onChanged: (value){
              if(value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            //onSaved: (pin){},
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],

            decoration: InputDecoration(
                // hintText: "*",
                border: OutlineInputBorder(

                )
            ),
          ),
        ),
      ),
    );
  }
}