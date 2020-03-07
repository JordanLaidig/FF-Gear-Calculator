import 'package:flutter/material.dart';

class GearChoice extends StatefulWidget {
  GearChoice({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GearChoiceState createState() => _GearChoiceState();
}

class _GearChoiceState extends State<GearChoice> {
  int _counter = 0;
  String dropdownValueClass = "Class";
  String dropdownValueLevel = "Level";
  String dropdownValueFilter = "Filter";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
