import 'package:flutter/material.dart';

class ExpandedCTAButton extends StatelessWidget {
  final String _title;
  final BorderRadius _borderRadius; // please use BorderRadius.only()
  final Color _color;
  final dynamic _onTapHandler;
  final bool _useIcon;
  final String _iconPath;
  const ExpandedCTAButton(this._title, this._borderRadius, this._color,
      this._onTapHandler, this._useIcon, this._iconPath,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Call Button
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Material(
          borderRadius: _borderRadius,
          color: _color,
          child: Ink(
            child: InkWell(
              borderRadius: _borderRadius,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Offstage(
                    //   offstage: _useIcon && _iconPath.isNotEmpty,
                    //   child: Image.asset(
                    //     _iconPath,
                    //     width: 30,
                    //     height: 30,
                    //   ),
                    // ),
                    if (_useIcon && _iconPath.isNotEmpty)
                      Image.asset(
                        _iconPath,
                        width: 30,
                        height: 30,
                      ),
                    const SizedBox(width: 10),
                    Text(
                      _title,
                      style:
                          const TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ],
                ),
              ),
              // ignore: avoid_print
              onTap: () => _onTapHandler(context),
            ),
          ),
        ),
      ),
    );
  }
}
