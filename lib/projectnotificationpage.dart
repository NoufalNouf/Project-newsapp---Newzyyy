import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newzy/getbyidhomepage.dart';
import 'package:newzy/projectlogin.dart';
import 'package:newzy/projectsettingspage.dart';
import 'package:http/http.dart' as http;
import 'package:newzy/sportsnews.dart';

import 'GlobalNews.dart';
import 'LocalNews.dart';
import 'bookmarks.dart';
import 'mainhomepage.dart';
import 'techNews.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {

  Future<bool>? _success;

  Future<List<News>> data() async {
    var result = await http.get(Uri.parse(
        "http://node.noufal.tech/api/newsfeed/getall"));
    var data = jsonDecode(result.body);
    return (data as List).map((e) => News.fromJson(e)).toList();
  }

  Future<List<News>> fetch(String id, String categoryname) async {
    var result = await http.post(Uri.parse(""),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, dynamic>{
          "_id": id,
          "category_name": categoryname,
        }));

    return jsonDecode(result.body)["success"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settings()),
                );
              },
              icon: Icon(
                Icons.settings,
                color: Colors.blue,
              )),
          title: Center(
              child: Text(
            "Discover",
            style: TextStyle(fontSize: 20),
          )),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) =>  newe(

                  )),
                );

              },
              child: Row(
                children: [
                  Text(
                    "My Feed",
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
           child:
          Column(
            children: [
        Column(
          children: [
            Container(
              height: 180,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => newe()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/feeds.png"))),
                            ),
                            Text("My Feeds")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GlobalNews()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/images-removebg-preview.png"))),
                            ),
                            Text("Global")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SportsNews()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/sports.png"))),
                            ),
                            Text("Sports")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocalNews()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/locall.png"))),
                            ),
                            Text("Local")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => techNews()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/tech.png"))),
                            ),
                            Text("Technical")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    bookmarks()),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/bookmarks.png"))),
                            ),
                            Text("Bookmarks")
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
            ),

          ///Notification
            FutureBuilder(
                future: data(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    List<News> newsById = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text(
                            "Notifications",
                            style: TextStyle(color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // color: Colors.blue
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 590,
                          child: ListView.builder(
                            itemCount: newsById.length,
                            itemBuilder: (BuildContext context, int index) {
                              String id = newsById[index].sId!;  // Handle id as a String
                              String? imageUrl = newsById[index].newsfeedImage;
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => getbyidhome(id: id)),
                                      );
                                    },
                                    title: Text(
                                      newsById[index].newsfeedTitle!,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    trailing: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: imageUrl != null && imageUrl.isNotEmpty
                                            ? DecorationImage(
                                          image: NetworkImage(
                                              "http://node.noufal.tech/api${imageUrl}"),
                                          fit: BoxFit.fill,
                                          onError: (error, stackTrace) {
                                            print(
                                                'Image load error for URL $imageUrl: $error');
                                          },
                                        )
                                            : null,
                                      ),
                                      child: imageUrl == null || imageUrl.isEmpty
                                          ? Center(child: Text('Image not available'))
                                          : null,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  else if(snapshot.hasError){
                    Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }
            )






          ],
        ),


            ],
          ),
        ),
      ),
    );
  }
}

class dataModel {
  String? header;
  String? image;

  dataModel(this.header, this.image);
}

List lis = data.map((e) => dataModel(e["header"], e["image"])).toList();

var data = [
  {
    "header": "PM Modi attacks Congress, DMK on Katchatheevu, 'Shakti' remarks",
    "image": "images/modi.jpg",
  },
  {
    "header":
        "'My Wife Has Never...': Gautam Gambhir 'Blushes' On Air As He Is Told This By Cyrus Broachaa",
    "image": "images/gambir.webp"
  },
  {
    "header":
        "'MS Dhoni Threw Pads, Helmet. Never Saw Him That Angry' Suresh Raina Shares Stunning CSK Tale",
    "image": "images/don.webp"
  },
  {
    "header":
        "Anjum Khan, Wife Of Shivam Dube, Pens Emotional Note For MS Dhoni",
    "image": "images/shivam.webp"
  },
  {
    "header":
        "Why Are People Rushing To Get This Stylish New SmartWatch? The Health Benefits Are Incredible",
    "image": "images/watch.png"
  },
  {
    "header":
        "The Caretaker and The White Tiger Reunite After Five Whole Years – See the Animal’s Response!",
    "image": "images/tigerr.jpg"
  },
  {
    "header":
        "Rohit Sharma Isn't Staying With MI Teammates During Home IPL 2024 Games. Here's Why",
    "image": "images/rohit.webp"
  },
  {
    "header":
        "The Federal Government Offers To Wipe Out Your Tax Debt Through New IRS Fresh Start Program.",
    "image": "images/federal.jpeg"
  },
  {
    "header":
        "Malaika Arora Asks Son Arhaan When He Lost His Virginity. His One-Word Reaction",
    "image": "images/girl.webp"
  },
  {
    "header":
        "With ₹ 5,785 Crore Assets, This Lok Sabha Contestant Is Wealthiest So Far",
    "image": "images/unkn.webp"
  },
  {
    "header":
        "'My Wife Has Never...': Gautam Gambhir 'Blushes' On Air As He Is Told This By Cyrus Broachaa",
    "image": "images/gambir.webp"
  },
  {
    "header":
        "'MS Dhoni Threw Pads, Helmet. Never Saw Him That Angry' Suresh Raina Shares Stunning CSK Tale",
    "image": "images/don.webp"
  },
  {
    "header":
        "Anjum Khan, Wife Of Shivam Dube, Pens Emotional Note For MS Dhoni",
    "image": "images/shivam.webp"
  },
];
