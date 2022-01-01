// ignore_for_file: avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:werk/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werk/pages/details.dart';
import 'package:werk/pages/listcontainer.dart';

const String bgPath = 'assets/bg_images/search_form/background_decor.svg';
const String magGlassPath = 'assets/icons/MagnifyingGlass.svg';

Widget bgSvg = SvgPicture.asset(bgPath, semanticsLabel: 'Background Image');
Widget magGlassIcon =
    SvgPicture.asset(magGlassPath, semanticsLabel: 'Mag Glass Icon');

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var data = {'provinsi': '', 'kabkota': ''};

  handleSetData(String type, String newData) {
    setState(() {
      data[type] = newData;
    });
  }

  moveToDetailPage(Object data, BuildContext context) {
    print(data);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListContainer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBg,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 69),
              alignment: Alignment.topRight,
              child: bgSvg,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0,
                        blurRadius: 25,
                        offset: Offset(3, 4),
                      )
                    ]),
                child: Column(
                  children: [
                    InputDropdown(handleSetData, 'provinsi', 'Provinsi'),
                    InputDropdown(
                        handleSetData, 'kabkota', 'Kabupaten atau Kota'),
                    const SizedBox(height: 40),
                    Material(
                      color: primaryBtn,
                      borderRadius: BorderRadius.circular(12),
                      child: Ink(
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  magGlassIcon,
                                  const SizedBox(width: 20),
                                  const Text(
                                    'Cari Rumah Sakit',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                          onTap: () => moveToDetailPage(data, context),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 90),
              child: const Text(
                'Pilih alamat rumah sakit yang dituju.',
                style: TextStyle(
                    fontSize: 36,
                    wordSpacing: 0,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputDropdown extends StatefulWidget {
  final dynamic Function(String, String) _onChanged;
  final String _type;
  final String _title;
  const InputDropdown(this._onChanged, this._type, this._title, {Key? key})
      : super(key: key);

  @override
  _InputDropdownState createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  final List<String> listData = [
    'hello',
    'world',
    'hello',
    'world',
    'hello',
    'world',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        showSelectedItems: true,
        onChanged: (e) => widget._onChanged(widget._type, e.toString()),
        showSearchBox: true,
        items: listData,
        label: widget._title,
        popupItemDisabled: (String s) => s.startsWith('I'),
      ),
    );
  }
}
