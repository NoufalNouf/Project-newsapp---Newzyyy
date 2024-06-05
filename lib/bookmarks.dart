import 'package:flutter/material.dart';

class bookmarks extends StatefulWidget {
  const bookmarks({super.key});

  @override
  State<bookmarks> createState() => _bookmarksState();
}

class _bookmarksState extends State<bookmarks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        
        
        
        
        body: Column(
          children: [
            SizedBox(height: 150,),
            
            Center(
              child: Icon(Icons.bookmark_border_outlined,
                color: Colors.blueAccent,size: 200,),
            ),

                SizedBox(height: 20,),
          

            Text("No Bookmarks",style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),),


            SizedBox(height: 20,),
            
            
            
            Text("Tap on the title to bookmark a story",style: TextStyle(
              fontSize: 20
            ),)
          ],
        ),
        
        
        
      ),
    );
  }
}
