import 'package:flutter/material.dart';

class PillButton extends StatefulWidget {
  final int _index;
  final String _text;
  final ValueChanged<int> _onPressed;
  final int _selected;
  const PillButton(this._text, this._onPressed, this._selected, this._index,
      {Key? key})
      : super(key: key);
  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
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
