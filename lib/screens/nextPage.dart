import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_1/screens/accueil.dart';

class NextPage extends StatefulWidget {
  final int ouiIlLeFaut;
  const NextPage({Key? key, required this.ouiIlLeFaut}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPage();
}

class _NextPage extends State<NextPage> {
  int random = 0;
  int random1 = 0;
  int reponse = 0;
  String message = '';
  List<String> list = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"];
  int _valueDropDown = 1;
  void _showToast(BuildContext context, String _message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(_message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: ListView(
        children: <Widget>[
          Center(
            child: Text(
              '$random + $random1',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Center(
            child: OutlinedButton(
              child: Text("Nombre Random"),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  var intValue = Random().nextInt(_valueDropDown+1);
                  random = intValue;
                  var intValue1 = Random().nextInt(_valueDropDown+1);
                  random1 = intValue1;
                });
              },
            ),
          ),
          Center(
              child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 25,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Entrer la solution',
                      hintText: 'Entrer un nombre',
                      border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      reponse = int.parse(value);
                    });
                  })),
          Center(
            child: OutlinedButton(
              child: Text("Valider"),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                if (reponse == random + random1) {
                  setState(() {
                    message = "Bonne réponse !";
                  });
                } else {
                  setState(() {
                    message = "Mauvaise réponse !";
                  });
                }
                _showToast(context, message);
              },
            ),
          ),
          Center(
            child: DropdownButton(
              value: _valueDropDown.toString(),
                items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
                
              }).toList(),
              onChanged: (value) {
                    setState(() {
                      _valueDropDown = int.parse(value!);
                    });
              }
            ),
          ),
        ],
      ),
    );
  }
}
