import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newzy/listforhomepage.dart';
import 'package:newzy/projectnotificationpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'techNews.dart';

class newe extends StatefulWidget {

   // final int id;

  const newe({Key? key,
    // required this.id
  } ) : super(key: key,);

  @override
  _neweState createState() => _neweState();
}

class _neweState extends State<newe> {

   DateTime backButton = DateTime.now();


  // int selStudId = 0;
 late Future<List<News>> _future;
  // List<CatDet> filteredCatList = [];
  // List<int> selectedIndices = [];


  Future<List<News>> fetch() async {
    // int id = widget.id;
    var result = await http
        .get(Uri.parse("http://node.noufal.tech/api/newsfeed/getall"));
    var data = jsonDecode(result.body);
    return (data as List).map((e) => News.fromJson(e)).toList();
  }


 // Future<List<News>> news() async {
 //   int id = widget.id;
 //   var result = await http
 //       .get(Uri.parse("http://node.noufal.tech/api/newsfeed/getbyid/$id"));
 //   var data = jsonDecode(result.body);
 //   return (data as List).map((e) => News.fromJson(e)).toList();
 // }



  void initState() {
    super.initState();
    _future = fetch();
    _refresh();
  }

  Future<void> _refresh() async {
    Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _future = fetch();
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);

    final a = GlobalKey();

    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          if(DateTime.now().difference(backButton)>=Duration(seconds: 2)){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Press back button again"),
              duration: Duration(seconds: 2),
            ));
            backButton = DateTime.now();
            return false;
          }else
          {return true;}
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Newzyyy",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notification()),
                    );
                  },
                  icon: Icon(CupertinoIcons.arrow_left)),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        _refresh();
                      });
                    },
                   icon: Icon( Icons.refresh,
                    size: 30,
                  ),)
                ),
              ],
            ),
            body:
            FutureBuilder(
                future: fetch(),
                builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No Records Found"));
                  } else {
                    List<News> list = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: _refresh,
                      child:
                      PageView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          pageSnapping: true,
                          itemBuilder: (context, index) {
                            final item = list[index];
                            String? imageUrl = list[index].newsfeedImage;

                            return GestureDetector(
                              onHorizontalDragEnd: (dragdetails) {
                                if (dragdetails
                                        .velocity.pixelsPerSecond.dx > 1) {
                                  // Swiping to the right
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            notification()),
                                  );
                                } else {
                                  // Swiping to the left

                                  String url = (list[index].url!); // Assuming lis1[index].url holds the URL to open
                                  _launchURL(url); // Call the function to launch the internal browser
                                }
                              },
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Card(
                                      child: Container(
                                        height: 250,
                                        width: 380,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: imageUrl != null &&
                                                  imageUrl.isNotEmpty
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      "http://node.noufal.tech/api${imageUrl}"),
                                                  fit: BoxFit.fill,
                                                  onError:
                                                      (error, stackTrace) {
                                                    print(
                                                        'Image load error for URL $imageUrl: $error');
                                                  },
                                                )
                                              : null,
                                        ),
                                        child: imageUrl == null ||
                                                imageUrl.isEmpty
                                            ? Center(
                                                child: Text(
                                                    'Image not available'))
                                            : null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        list[index].newsfeedTitle!,
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        list[index].newsfeedDescription!,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("   "),
                                        Text("   "),
                                        Text(
                                          "Swipe left to know more",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.swipe_left,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                        Text("   "),
                                        Text("   "),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    );

                  }
                })






        ),
      ),
    );
  }
}

class News {
  String? sId;
  List<CategoryDetail>? categoryDetail;
  String? newsfeedTitle;
  String? newsfeedDescription;
  String? newsfeedImage;
  String? publishedAt;
  String? url;
  int? iV;

  News(
      {this.sId,
      this.categoryDetail,
      this.newsfeedTitle,
      this.newsfeedDescription,
      this.newsfeedImage,
      this.publishedAt,
      this.url,
      this.iV});

  News.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['category_detail'] != null) {
      categoryDetail = <CategoryDetail>[];
      json['category_detail'].forEach((v) {
        categoryDetail!.add(new CategoryDetail.fromJson(v));
      });
    }
    newsfeedTitle = json['newsfeed_title'];
    newsfeedDescription = json['newsfeed_description'];
    newsfeedImage = json['newsfeed_image'];
    publishedAt = json['publishedAt'];
    url = json['url'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.categoryDetail != null) {
      data['category_detail'] =
          this.categoryDetail!.map((v) => v.toJson()).toList();
    }
    data['newsfeed_title'] = this.newsfeedTitle;
    data['newsfeed_description'] = this.newsfeedDescription;
    data['newsfeed_image'] = this.newsfeedImage;
    data['publishedAt'] = this.publishedAt;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}

class CategoryDetail {
  String? sId;
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  CategoryDetail(
      {this.sId, this.categoryId, this.categoryName, this.categoryImage});

  CategoryDetail.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
