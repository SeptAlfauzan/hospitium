import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:werk/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werk/widgets/ExpandedCTAButton.dart';
import 'package:werk/widgets/detailInfo.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: primaryBg),
        child: Stack(
          children: [
            Lottie.asset('assets/lotties/animation_kxu0rqo8.json',
                repeat: false),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 7,
                        offset: Offset(3, 3)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: const DetailInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
