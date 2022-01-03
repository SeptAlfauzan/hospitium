import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospitium/pages/details.dart';
import 'package:hospitium/pages/loading.dart';
import 'package:hospitium/widgets/cardOfList.dart';
import 'package:hospitium/widgets/pillButton.dart';

class ListContainer extends StatefulWidget {
  const ListContainer({Key? key}) : super(key: key);
  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  int _selected = 0;
  bool _status = false;
  _ListContainerState() {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        _status = true;
      });
    });
  }

  onPressed(index) {
    setState(() {
      _selected = index;
    });
  }

  moveToDetails(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Details()));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.16;
    return Scaffold(
      body: _status
          ? Container(
              margin: const EdgeInsets.only(top: 20, bottom: 0),
              child: Stack(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: _height),
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) =>
                          CardOfList(context, moveToDetails),
                    ),
                  ),
                ),
                Container(
//TOP BAR
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                      color: Color(0xffF9FFFE),
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 0.3))),
                  height: _height,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: const Text(
                            'Data rumah sakit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Wrap(
                            spacing: 5,
                            children: <Widget>[
                              PillButton('Semua', onPressed, _selected, 0),
                              PillButton('Tersedia', onPressed, _selected, 1),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )
          : const Loading(),
    );
  }
}
