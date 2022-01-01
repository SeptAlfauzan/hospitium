import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  final String animPath = 'assets/lotties/loading_data_anim.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(animPath),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Text(
                  "Tunggu, kami sedang mengumpulkan data rumah sakit untuk anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff7B7B7B),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
