import 'package:flutter/material.dart';

class CardOfList extends StatelessWidget {
  final BuildContext _context;
  final dynamic _tapHandler;
  const CardOfList(this._context, this._tapHandler, {Key? key})
      : super(key: key);

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
                              const Text(
                                '1000',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
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
