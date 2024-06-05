import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class imagepicker extends StatefulWidget {
  const imagepicker({super.key});

  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {

File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: ()
                  {
                    pickImage();
                  }
              ),

              SizedBox(height: 20,),

              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickCamera();
                  }
              ),

              SizedBox(height: 30,),

              Stack(
                children: [
                  CircleAvatar(

                    radius: 70,
                    backgroundColor: Colors.blueAccent,
                    child: Image.file(File(image!.path)),

                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera,
                    color: Colors.blue,)),

                ],
              )


            ],
          ),
        )
    );
  }
}
