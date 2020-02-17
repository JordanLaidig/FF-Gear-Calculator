import 'package:flutter/material.dart';

class GearSelection extends StatefulWidget {
  GearSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GearSelectionState createState() => _GearSelectionState();
}

class _GearSelectionState extends State<GearSelection> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have found',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_counter pieces of gear',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
