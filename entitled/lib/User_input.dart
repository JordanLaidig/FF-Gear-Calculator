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
  String dropdownValuePiece = "Gear Slot";
  String dropdownValueFilter = "";
  final _formKey = GlobalKey<FormState>();

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
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
                  child: DropdownButtonFormField(
                    value: dropdownValueClass,
                    icon: Icon(Icons.arrow_downward),
                    isExpanded: true,
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
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
                    validator: (dropdownValueClass) {
                      if (dropdownValueClass == 'Class') {
                        return "Please select a class";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
                  child: DropdownButtonFormField(
                    value: dropdownValueLevel,
                    icon: Icon(Icons.arrow_downward),
                    isExpanded: true,
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
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
                    validator: (dropdownValueLevel) {
                      if (dropdownValueLevel == 'Level') {
                        return "Please select a level";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
                  child: DropdownButtonFormField(
                    value: dropdownValuePiece,
                    icon: Icon(Icons.arrow_downward),
                    isExpanded: true,
                    iconSize: 20,
                    elevation: 10,
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValuePiece = newValue;
                      });
                    },
                    items: <String>[
                      'Gear Slot',
                      'Weapon',
                      'Off Hand',
                      'Head',
                      'Chest',
                      'Hands',
                      'Belt',
                      'Legs',
                      'Feet',
                      'Earrings',
                      'Necklace',
                      'Bracelet',
                      'Ring'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (dropdownValuePiece) {
                      if (dropdownValuePiece == 'Gear Slot') {
                        return "Please select a Gear Slot";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Item Level",
                      hintStyle: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueFilter = newValue;
                      });
                    },
                    validator: (dropdownValueFilter) {
                      if (dropdownValueFilter.isEmpty) {
                        return "Please select an Item Level";
                      } else {
                        var value = int.tryParse(dropdownValueFilter);
                        if (value == null)
                          return "Invalid Input. Must be a Number";
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text("FINAL FANTASY XIV ©️ 2010 - 2020 SQUARE ENIX CO., LTD. All Rights Reserved."),
                )
              ),
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text("FINAL FANTASY is a registered trademark of Square Enix Holdings Co., Ltd."),
                  )
              ),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GearChoice(
                                        title: dropdownValueClass +
                                            " " +
                                            dropdownValueLevel,
                                        Class: dropdownValueClass,
                                        Level: dropdownValueLevel,
                                        GearPiece: dropdownValuePiece,
                                        Filter: dropdownValueFilter,
                                      )),
                            );
                          }
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
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
