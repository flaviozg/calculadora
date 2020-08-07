import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'functions.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  final _functions = Functions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          _visor(),
          Divider(height: 0.1),
          _teclas(),
        ],
      ),
    );
  }

  Widget _visor() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                NumberFormat.decimalPattern("pt_BR")
                    .format(double.parse(_functions.result)),
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botao(String label,
      {int flex = 1,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.white24}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: backgroundColor,
        textColor: textColor,
        // padding: const EdgeInsets.only(top: 20, bottom: 20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
        onPressed: () {
          setState(() {
            _functions.execButton(label);
          });
        },
      ),
    );
  }

  Widget _teclas() {
    return Container(
      color: Colors.black,
      height: 500.0,
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _botao('AC',
                    backgroundColor: Colors.grey, textColor: Colors.black),
                _botao('±',
                    backgroundColor: Colors.grey, textColor: Colors.black),
                _botao('%',
                    backgroundColor: Colors.grey, textColor: Colors.black),
                _botao('÷', backgroundColor: Colors.deepOrange),
              ],
            ),
          ),
          Divider(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _botao('7'),
                _botao('8'),
                _botao('9'),
                _botao('x', backgroundColor: Colors.deepOrange),
              ],
            ),
          ),
          Divider(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _botao('4'),
                _botao('5'),
                _botao('6'),
                _botao('-', backgroundColor: Colors.deepOrange),
              ],
            ),
          ),
          Divider(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _botao('1'),
                _botao('2'),
                _botao('3'),
                _botao('+', backgroundColor: Colors.deepOrange),
              ],
            ),
          ),
          Divider(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _botao('0', flex: 2),
                _botao(','),
                _botao('=', backgroundColor: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
