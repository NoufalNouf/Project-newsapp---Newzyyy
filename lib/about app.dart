import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About App",style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Text("'NEWZYYY' is a news update application designed to provide users with quick and concise summaries of the latest news stories from around the world. Our mission is to keep you informed and up-to-date with the most important events and developments, all in a format that's easy to digest and convenient to access.\n\n"
    "Key Features:\n\nShort, Summarized News:   We understand that your time is valuable, so we deliver news updates in brief, easy-to-read summaries. Get the gist of each story without the need to sift through lengthy articles.\n\nCustomizable News Feed:   Tailor your news feed to your interests by selecting from a variety of categories, including politics, technology, sports, entertainment, and more. Personalize your news experience to suit your preferences.\n\nInternal Browser:   Seamlessly view full articles within the app using our integrated browser feature. No need to switch between multiple apps or browsers—get all the information you need right here.\n\nUser-Friendly Interface:   Our intuitive user interface makes navigating the app a breeze. Whether you're a seasoned news reader or new to the world of current events, 'NEWZYYY' is designed with you in mind.\n\nFast and Reliable:   We strive to deliver news updates quickly and reliably, ensuring that you're always in the know about what's happening in the world around you."),

    );
  }
}
