import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hospitium/colors.dart';
import 'package:hospitium/widgets/detailInfo.dart';

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
