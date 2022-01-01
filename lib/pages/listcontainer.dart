import 'dart:async';

import 'package:flutter/material.dart';
import 'package:werk/pages/details.dart';
import 'package:werk/pages/loading.dart';

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
                          Card(context, moveToDetails),
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
                              Grouping('Semua', onPressed, _selected, 0),
                              Grouping('Tersedia', onPressed, _selected, 1),
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

class Grouping extends StatefulWidget {
  final int _index;
  final String _text;
  final ValueChanged<int> _onPressed;
  final int _selected;
  const Grouping(this._text, this._onPressed, this._selected, this._index,
      {Key? key})
      : super(key: key);
  @override
  State<Grouping> createState() => _GroupingState();
}

class _GroupingState extends State<Grouping> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget._selected == widget._index
          ? const Color(0xff26FFCB)
          : const Color(0xcfffffff),
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        decoration: widget._selected == widget._index
            ? null
            : BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => widget._onPressed(widget._index),
          enableFeedback: true,
          splashColor: const Color(0xff40E5BE),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              widget._text,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final BuildContext _context;
  final dynamic _tapHandler;
  const Card(this._context, this._tapHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.2, color: Colors.black38),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          child: InkWell(
            onTap: () => _tapHandler(_context),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 22),
              child: Stack(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Nama rumah sakit panjang',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF212121),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Alamat rumah sakit',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Color(0xFF212121),
                              ),
                            ),
                          ],
                        )),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'sisa kamar',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11.0, color: Color(0xFF212121)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            // ROW ICON, AMOUNT OF LEFT ROOM,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/icons/Bed.png',
                              ),
                              const Text('1000',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Align(alignment: Alignment.topRight, child: Dots('red')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class Dots extends StatelessWidget {
  const Dots(this._color, {Key? key}) : super(key: key);
  final String _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
      transform: Matrix4.translationValues(5, -5, 0),
      child: const SizedBox(
        height: 10,
        width: 10,
      ),
    );
  }
}
