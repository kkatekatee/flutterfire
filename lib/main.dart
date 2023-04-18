import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('gami-dev-on-off-incentive').snapshots(includeMetadataChanges: true),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        return Text(
                          '${snapshot.data?.docs.map((e) => e.data())}',
                          style: const TextStyle(fontSize: 30),
                        );
                      }),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(
                //   style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(500, 100))),
                //   onPressed: () {
                //     Map json = {
                //       "token":
                //           "eyJFbnRpdHkiOiJBQEIiLCJBcHBJZCI6ImlCdWRkeSIsIlVzZXJJZCI6IjcwMDAyNTA4IiwidHlwIjoiand0IiwiYWxnIjoiSFM1MTIiLCJybmQiOiJNWVlLOFB0cVJuVmxHWFlvIn0.eyJVc2VySWQiOiI3MDAwMjUwOCIsInJvbGVzIjpbIlVTRVIiXSwiTXJDb2RlIjoiSzI5MiIsIkJyYW5jaElkIjoiMTYiLCJzdWIiOiI3OWY2NDg4NS02YTRmLTQ4MjctYWRmZC1jNTI2NDg0MmQxYzEiLCJzY29wZXMiOlt7ImF1dGhvcml0eSI6IlJPTEVfQ0xJRU5UIn1dLCJhcHBJZCI6ImMyNWRjNTllLTQzYjktNGMzOC04YTAzLWYyOWMyYzBhYjc4ZCIsInJuZCI6IldXMnVoQTVvTUFwWDd0NWciLCJpYXQiOjE2ODEzMTUwOTEsImV4cCI6MTY4MTMyMDQ5MX0.WImso6vb69Kuml-yPHAmDp27HBJuwD1KxLk6Xrk4KU4JvRshKgUrPZBdN-mSkpWQxgNUt5rNJhmWivPDYZpNIA",
                //       "refreshToken":
                //           "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3OWY2NDg4NS02YTRmLTQ4MjctYWRmZC1jNTI2NDg0MmQxYzEiLCJzY29wZXMiOiJSRUZSRVNIX1RPS0VOIiwiYXBwSWQiOiJjMjVkYzU5ZS00M2I5LTRjMzgtOGEwMy1mMjljMmMwYWI3OGQiLCJqdGkiOiI2YmM0NGI5Zi1mYWFhLTRkNjktYjhjNi05NGUzMGRjYmMxZjEiLCJpYXQiOjE2ODEyOTE5MTYsImV4cCI6MTY4MTM3ODMxNn0.0QXXhIvkbHLOz3s6iViRsglJuufpc28CUNJAdaxOEXN1yyGmve91tSMYMaNeWHUP7SboW0t8DI_DjYrsAtAdZw"
                //     };
                //     String token = json["token"];
                //     String refreshToken = json["refreshToken"];
                //     gami_app.init(context: context, flavorName: 'dev', mrName: 'test test', token: token, refreshToken: refreshToken);
                //   },
                //   child: const Text(
                //     'Go to Gamification >>',
                //     style: TextStyle(fontSize: 30),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
