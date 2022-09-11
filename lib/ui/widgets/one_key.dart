import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number, required this.callback})
      : super(key: key);

  final int number;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    // TODO.
    // te le mides a mejorar este key??
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: MaterialButton(
            key: Key(number.toString()),
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            onPressed: () {
              callback(number);
            },
            child: Text(
              number.toString(),
              style: GoogleFonts.roboto(
                fontSize: 25,
                //fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
