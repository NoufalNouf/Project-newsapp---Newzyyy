import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newzy/projectloginpage.dart';
import 'package:newzy/termsservive.dart';


import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'about app.dart';
import 'contact.dart';
import 'language.dart';
import 'modeltheme.dart';
import 'notification.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {



  String name = "Your Name";

  TextEditingController nouf = TextEditingController();
  TextEditingController nouf1 = TextEditingController();

  List n = [];

  late SharedPreferences _prefs;
  late String? _imagePath;

  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    _saveThemePreference(value); // Save theme preference when it changes
    // notifyListeners();
  }

  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);
  }

  void initState() {
    super.initState();
    _loadImageFromPreferences();
  }


  Future<void> _loadImageFromPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = _prefs.getString('saved_image');
    });
  }

  Future<void> _saveImageToPreferences(String imagePath) async {
    await _prefs.setString('saved_image', imagePath);
  }

  File? imageTemp;

  Future pickImage() async {
    // try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      imageTemp = File(image!.path);
    });
  }


  Future pickcamera() async {
    // try {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      imageTemp = File(image!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Text("Settings"),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      imageTemp != null
                          ? Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  image: DecorationImage(
                                    image: FileImage(imageTemp!),
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(),
                              ),
                              child: Center(child: Text("Add Image"))),

                      //   imageTemp != null ? Image.file(imageTemp!) :Text("data"),

                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext) {
                                  return Container(
                                    height: 100,
                                    width: double.infinity,
                                    // color: Colors.green,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // SizedBox(
                                          //   width: 40,
                                          // ),

                                          Text(" "),

                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    pickcamera();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.blue,
                                                    size: 40,
                                                  )),
                                              Text("Camera")
                                            ],
                                          ),
                                          // SizedBox(
                                          //   width: 30,
                                          // ),

                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    pickImage();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.image_outlined,
                                                    color: Colors.blue,
                                                    size: 40,
                                                  )),
                                              Text("Gallery"),
                                            ],
                                          ),

                                          Text(" "),
                                        ]),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          )),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                        Text(
                          name,
                           style: TextStyle(fontSize: 15,color: Colors.lightBlueAccent),
                        ),
                        IconButton(
                            onPressed: () {

                              nouf1.text = name;

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Edit Name"),
                                        content: Container(
                                          height: 155,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: nouf1,
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                              SizedBox(height: 40),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    final String value=nouf1.text;
                                                    setState(() {
                                                      name=value;


                                                      Navigator.of(context)
                                                          .pop();
                                                      nouf1.clear();
                                                    });
                                                  },
                                                  child: Text("Edit"))
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            icon: Icon(Icons.edit)),
                      ]),
                    ],
                  ),
                ),
                SwitchListTile(
                  title: Row(
                    children: [
                      Icon(Icons.dark_mode_outlined),
                      SizedBox(
                        width: 17,
                      ),
                      Text('Dark Mode'),
                    ],
                  ),
                  value: themeNotifier.isDark,
                  onChanged: (value) {
                    themeNotifier.isDark = value;
                  },
                ),

                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),





                Container(
                  height: 60,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => language()),
                        );
                      },
                      leading: Icon(Icons.language),
                      title: Text(
                        "Language",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => noti()),
                        );
                      },
                      leading: Icon(Icons.notifications_none_outlined),
                      title: Text(
                        "Notifications",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  height: 60,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => about()),
                        );
                      },
                      leading: Icon(Icons.announcement_outlined),
                      title: Text(
                        "About App",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text(
                    "Share",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "Feedback",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => terms()),
                    );
                  },
                  title: Text(
                    "Terms & Service",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => terms()),
                    );
                  },
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => contact()),
                    );
                  },
                  title: Text(
                    "Contact Us",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Center(
                                child: Text(
                                  'Log out from this account?',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ListTile(
                                      onTap: () async{
                                        try{
                                          final GoogleSignIn _google = new GoogleSignIn();
                                          _google.signOut();
                                        }catch(e){
                                          print(e);
                                        }

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signup()),
                                        );
                                      },
                                      title: Center(
                                        child: Text(
                                          "Log out",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      title: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 5,
                            ));



                  },
                  title: Text(
                    "Log out",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

