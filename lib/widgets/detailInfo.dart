import 'package:flutter/material.dart';
import 'package:werk/colors.dart';
import 'package:werk/widgets/ExpandedCTAButton.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);
  moveBack(BuildContext context) {
    Navigator.pop(context);
  }

  makeCall(BuildContext context) {
    const snackBar =
        SnackBar(content: Text('Anda telah mengklik tombol hubungi ✨'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final EdgeInsets _paddingCard = const EdgeInsets.only(left: 30, right: 30);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: _paddingCard,
                child: const Text(
                  'Nama Rumah Sakit blabla',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: _paddingCard,
                child: Row(
                  children: [
                    //icon
                    Image.asset(
                      'assets/icons/png/map (1).png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Alamat rumah sakit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              Padding(
                padding: _paddingCard,
                child: const Text(
                  'Ruangan khusus pasien COVID',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: _paddingCard,
                child: const Text(
                  'Update pada 12-12-2021',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xcff7B7B7B)),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Spacer(),
              Padding(
                padding: _paddingCard,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CardDetails(
                        'assets/icons/png/beds 1.png', 12, 'Tempat tidur'),
                    SizedBox(
                      width: 12,
                    ),
                    CardDetails('assets/icons/png/bed 1.png', 12, 'Kosong'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: [
                ExpandedCTAButton(
                  'Kembali',
                  const BorderRadius.only(topRight: Radius.circular(30)),
                  Colors.white,
                  moveBack,
                  true,
                  'assets/icons/png/back-arrow 1.png',
                ),
                ExpandedCTAButton(
                  'Hubungi',
                  const BorderRadius.only(topLeft: Radius.circular(30)),
                  primaryBtn,
                  makeCall,
                  true,
                  'assets/icons/png/call.png',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails(this.path, this.amount, this.text, {Key? key})
      : super(key: key);

  final String path;
  final int amount;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xcFFA0A0A0),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            text,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: const Color(0xcFFA0A0A0)),
          ),
          Row(
            children: [
              Image.asset(
                path,
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                amount.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
