import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Newzyyy",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => notification()),
                // );
                  },
                icon: Icon(CupertinoIcons.arrow_left)),

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => notification()),
                // );
              // },
              // icon: Icon(CupertinoIcons.arrow_left)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.refresh,
                size: 30,
              ),
            ),
          ],
        ),
        body: Container(
          height: 900,
          child:PageView(
            scrollDirection: Axis.vertical,
            // children: lis,
            controller: controller,
          ),
          // ListView.builder(
          //     itemCount: lis.length,
          //     itemBuilder: (BuildContext c, i) {
          //       return Column(
          //         children: [
          //           Container(
          //             height: 250,
          //             width: 380,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 image: DecorationImage(
          //                     image: AssetImage(lis[i].image),
          //                     fit: BoxFit.fill)),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               lis[i].header,
          //               style: TextStyle(
          //                   fontSize: 28, fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               lis[i].Desp,
          //               style: TextStyle(fontSize: 17),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 70,
          //           ),
          //           Divider(
          //             thickness: 5,
          //             endIndent: 10,
          //             indent: 10,
          //           ),
          //           SizedBox(
          //             height: 70,
          //           ),
          //         ],
          //       );
          //     }),
        ),
      ),
    );
  }
}

class dataModel {
  String? image;
  String? header;
  String? Desp;

  dataModel(this.image, this.header, this.Desp);
}

List lis =
    data.map((e) => dataModel(e["image"], e["text"], e["Desp"])).toList();

var data = [
  {
    "image": "images/doniiiii.webp",
    "text":
        "MS Dhoni could leave as a winner: Styris predicts CSK to play IPL 2024 final",
    "Desp":
        "Former New Zealand all-rounder Scott Styris believes that Chennai Super Kings can play the Indian Premier League (IPL) 2024 final at the Chepauk in Chennai on May 26. As the fixtures for the rest of the IPL 2024 were announced on Monday, March 25, all the eyes of Indian cricket fans were focused on the highly anticipated final match of this season. Styris said he can see MS Dhoni to mark a winning end to his career, by getting his sixth IPL trophy with CSK this year."
  },
  {
    "image": "images/sydney.webp",
    "text":
    "6 Killed In Sydney Mall Stabbings, Attacker Shot Dead, Say Police",
    "Desp":
        "he number of people killed by a knife-wielding assailant in a Sydney shopping centre Saturday has climbed to six, police said. One last person died at hospital a New South Wales police spokesman told AFP. The attacker was shot dead at the scene by a senior policewoman. "
  },
  {
    "image": "images/solar.webp",
    "text":
        "Insolation Energy: This Stock Has Run Up 4200% In 18 Months. More To Come?",
    "Desp":
        "Over the past 12-18 months, there has been significant interest in initial public offerings from small and medium enterprises. Insolation Energy Ltd. has particularly stood out, achieving remarkable growth with a 1,200% return over the past year. The company's IPO debuted in September 2022 at Rs 38 per share. Today, the stock is trading at Rs 1,644 per share, reflecting an stellar return of 4,200%"
  },
  {
    "image": "images/bonvita.webp",
    "text":
        "Remove Bournvita From 'Health Drinks' Category: Centre's Big Order",
    "Desp":
        "The Ministry of Commerce and Industry has issued an advisory to the e-commerce companies, directing them to remove all drinks and beverages including Bournvita from the category of 'health drinks', on their portal and platforms."
  },
  {
    "image": "images/ship.webp",
    "text":
        "Iran Could Attack Israel Within 24 Hours, US Rushes Warships To Aid Ally",
    "Desp":
        "Israel is bracing for a direct attack by Iran as warnings grow of retaliation for the killing last week of a senior officer in Iran's embassy in Damascus. US and other intelligence assessments have said the retaliation could come as soon as Sunday. The unprecedented attack could trigger an all-out regional war."
  },
  {
    "image": "images/mayank.webp",
    "text":
        "Why India's 156.7 Kmph Pace Sensation Mayank Yadav Should Not Be Picked For T20 World Cup",
    "Desp":
        "Nearly one-third of the Indian Premier League 2024 season is done and dusted and like always, the competition has already unearthed some gems from the domestic circuit. Apart from the batting pyrotechnics by Shashank Singh and Ashutosh Sharma, India has also discovered a bowler with raw pace in Mayank Yadav, who has grabbed eyeballs in IPL 2024 having consistently clocked deliveries over 150 kmph. He also bowled the fastest ball of the season at 156.7 kmph."
  },
];
