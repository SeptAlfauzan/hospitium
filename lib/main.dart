import 'dart:async';
import 'package:flutter/material.dart';
import 'package:werk/pages/listcontainer.dart';
import 'package:werk/pages/loading.dart';
import 'package:werk/pages/searchForm.dart';
import 'package:werk/pages/details.dart';
import 'package:werk/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  final bool status = false;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshoot) =>
          snapshoot.connectionState == ConnectionState.waiting
              ? const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Splash(),
                )
              : MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blueGrey,
                  ),
                  home: const SearchForm(),
                ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _imageSrc =
      'https://images.unsplash.com/photo-1608889825205-eebdb9fc5806?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                    widthFactor: 0.3,
                    heightFactor: 0.2,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(_imageSrc),
                            radius: 100,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0)),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: const Text(
                              'Mia B',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              color: Colors.white30,
            ),
          ),
        ]));
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 2));
  }
}
