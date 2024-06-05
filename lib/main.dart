import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newzy/phone%20verification.dart';
import 'package:newzy/projectlogin.dart';
import 'package:newzy/projectloginpage.dart';
import 'package:newzy/projectnotificationpage.dart';
import 'package:newzy/projectsettingspage.dart';
import 'package:newzy/projectsplashscreen.dart';
import 'package:newzy/willpop.dart';
import 'package:provider/provider.dart';

import 'contact.dart';
import 'mainhomepage.dart';
import 'modeltheme.dart';
import 'otp verifiction.dart';
import 'techNews.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDsDcLy44q4vBcvkHwf9Kz2pwb9VqaTVWw",
        appId: "1:1036132992310:web:f68a8fd70fa33acdd85f97",
        messagingSenderId: "1036132992310",
        projectId: "project-news-4cace",)
  );


  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isDarkMode = prefs.getBool('darkMode') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     String v = "v";

    // String? v;



    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
            return MaterialApp(
              title: 'Newzyyy',
              debugShowCheckedModeBanner: false,

                // ResponsiveWrapper.builder(
            //     BouncingScrollWrapper.builder(context, child!),
            // maxWidth: 1200,
            // minWidth: 450,
            // defaultScale: true,
            // breakpoints: [
            // const ResponsiveBreakpoint.resize(450, name: MOBILE),
            // const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            // const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            // const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            // const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            // ],
            //
              theme: themeNotifier.isDark ?
              ThemeData(
                useMaterial3: true,
                colorScheme:
                ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.green),
                textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
                primaryTextTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
              ) : ThemeData(
                useMaterial3: true,
                colorScheme:
                ColorScheme.fromSeed(brightness: Brightness.light,seedColor: Colors.red),
                textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
                primaryTextTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).apply(
                    bodyColor: Colors.black),
              ),
              home:  splash(),
              //settings(),
            );
          }),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
