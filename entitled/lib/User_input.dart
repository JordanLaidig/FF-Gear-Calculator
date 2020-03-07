import 'package:flutter/material.dart';
import 'package:entitled/Gear_Page.dart';

class GearSelection extends StatefulWidget {
  GearSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GearSelectionState createState() => _GearSelectionState();
}

class _GearSelectionState extends State<GearSelection> {
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
            Expanded(
              flex: 0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
                child: DropdownButton<String>(
                  value: dropdownValueClass,
                  icon: Icon(Icons.arrow_downward),
                  isExpanded: true,
                  iconSize: 30,
                  elevation: 10,
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueClass = newValue;
                    });
                  },
                  items: <String>[
                    'Class',
                    'Paladin',
                    'Warrior',
                    'Dark Knight',
                    'Gunbreaker',
                    'White Mage',
                    'Scholar',
                    'Astrologian',
                    'Dragoon',
                    'Monk',
                    'Ninja',
                    'Samurai',
                    'Bard',
                    'Machinist',
                    'Dancer',
                    'Summoner',
                    'Black Mage',
                    'Red Mage',
                    'Blue Mage'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
                child: DropdownButton<String>(
                  value: dropdownValueLevel,
                  icon: Icon(Icons.arrow_downward),
                  isExpanded: true,
                  iconSize: 30,
                  elevation: 10,
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueLevel = newValue;
                    });
                  },
                  items: <String>[
                    'Level',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                    '15',
                    '16',
                    '17',
                    '18',
                    '19',
                    '20',
                    '21',
                    '22',
                    '23',
                    '24',
                    '25',
                    '26',
                    '27',
                    '28',
                    '29',
                    '30',
                    '31',
                    '32',
                    '33',
                    '34',
                    '35',
                    '36',
                    '37',
                    '38',
                    '39',
                    '40',
                    '41',
                    '42',
                    '43',
                    '44',
                    '45',
                    '46',
                    '47',
                    '48',
                    '49',
                    '50',
                    '51',
                    '52',
                    '53',
                    '54',
                    '55',
                    '56',
                    '57',
                    '58',
                    '59',
                    '60',
                    '61',
                    '62',
                    '63',
                    '64',
                    '65',
                    '66',
                    '67',
                    '68',
                    '69',
                    '70',
                    '71',
                    '72',
                    '73',
                    '74',
                    '75',
                    '76',
                    '77',
                    '78',
                    '79',
                    '80'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
                child: DropdownButton<String>(
                  value: dropdownValueFilter,
                  icon: Icon(Icons.arrow_downward),
                  isExpanded: true,
                  iconSize: 30,
                  elevation: 10,
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueFilter = newValue;
                    });
                  },
                  items: <String>[
                    'Filter', 'Item Level', 'Substats'
                    ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GearChoice(title: dropdownValueClass + " " + dropdownValueLevel)),
                        );
                      },
                      child: Text(
                        'Search',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
