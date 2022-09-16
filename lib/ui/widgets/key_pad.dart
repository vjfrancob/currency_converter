import 'package:flutter/material.dart';
import 'one_key.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate})
      : super(key: key);

  // estos tres valores son recibidos de converter_page
  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  // valor de la moneda convertida
  double _currency2 = 0;
  // el valor de la moneda que es introducida en el keypad
  int _currency1 = 0;

  // Valor input divisa 1

  var userInput = '';

  // función que cambia el estado del widget (_currency1, _currency2)
  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        userInput = '';
        _currency2 = 0;
        _currency1 = 0;
      } else if (k == 11) {
        if (userInput.length > 1) {
          userInput = userInput.substring(0, userInput.length - 1);
          _currency1 = int.parse(userInput);
          _currency2 = _currency1 * widget.rate;
        } else {
          userInput = '';
          _currency2 = 0;
          _currency1 = 0;
        }
      } else {
        var temp_input = k.toString();
        userInput += temp_input;
        _currency1 = int.parse(userInput);
        _currency2 = _currency1 * widget.rate;
      }
    });
  }

  // Método que da formato a los números
  String formatCurrency(double num) {
    final formatter = NumberFormat('###,###,###,###.##', 'es_CO');
    return formatter.format(num);
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // aquí garantizamos que cuando el widget refresca el estado va a cero
    _currency2 = 0;
    _currency1 = 0;
    userInput = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.textCurrency1,
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 233, 113, 43),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    formatCurrency(double.parse(_currency1.toString())),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      //fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.textCurrency2,
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 233, 113, 43),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    formatCurrency(double.parse(_currency2.toString())),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      //fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 7, callback: _onPressed),
                  OneKey(number: 8, callback: _onPressed),
                  OneKey(number: 9, callback: _onPressed)
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 4, callback: _onPressed),
                  OneKey(number: 5, callback: _onPressed),
                  OneKey(number: 6, callback: _onPressed)
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 1, callback: _onPressed),
                  OneKey(number: 2, callback: _onPressed),
                  OneKey(number: 3, callback: _onPressed)
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: MaterialButton(
                      key: const Key("reset"),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      color: Color.fromARGB(25, 255, 255, 255),
                      onPressed: () {
                        _onPressed(10);
                      },
                      child: Text(
                        "AC",
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 233, 113, 43),
                        ),
                      )),
                ),
              ),
              OneKey(number: 0, callback: _onPressed),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    key: const Key("clear"),
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    color: Color.fromARGB(25, 255, 255, 255),
                    onPressed: () {
                      _onPressed(11);
                    },
                    child: const Icon(
                      Icons.backspace,
                      size: 30,
                      color: Color.fromARGB(255, 233, 113, 43),
                    ),
                  ),
                ),
              )
            ]),
          )
        ]);
  }
}
