import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _Accueil();
}

class _Accueil extends State<Accueil> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: <Widget>[
            Center(
              child: Image.network(
                'https://cdn.pixabay.com/photo/2023/07/05/11/14/alpaca-8108043_1280.png',
                width: 250,
              ),
            ),
            Center(
              child: Image.asset('images/full.png', width: 250, fit: BoxFit.scaleDown),
            ),
            Center(
              child: const Text(
                'Nombre:',
              ),
            ),
            Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            OutlinedButton(
                child: Text("-"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              onPressed: () {
                setState(() {
                   _decrementCounter();
                });
              },
            ),
            OutlinedButton(
                child: Text("Reset"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              onPressed: () {
                setState(() {
                   _resetCounter();
                });
              },
            ),
            OutlinedButton(
                child: Text("+"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              onPressed: () {
                setState(() {
                   _incrementCounter();
                });
              },
            ),
          ],
        ),
      );
  }
}