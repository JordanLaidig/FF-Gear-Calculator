import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:entitled/Gear_Classes.dart";
import "package:entitled/Gear_data.dart";

class GearChoice extends StatefulWidget {
  GearChoice(
      {Key key,
      this.title,
      this.Class,
      this.Level,
      this.GearPiece,
      this.Filter})
      : super(key: key);

  final String title;
  final String Class;
  final String Level;
  final String GearPiece;
  final String Filter;

  @override
  _GearChoiceState createState() => _GearChoiceState();
}

class _GearChoiceState extends State<GearChoice> {
  SelectedClass newClass;
  SelectedGearPiece newGearPiece;
  int newLevel;
  int newItemLevel;
  Future<Gear> fetchGear() async {
    final response = await http.get(
        'https://xivapi.com/search?filters=LevelEquip=$newLevel,LevelItem>=$newItemLevel,ClassJobCategory.${newClass.Class}=1,EquipSlotCategory.${newGearPiece.GearPiece}=1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Gear.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load gear');
    }
  }

  Future<Gear> GearCalculated;

  @override
  void initState() {
    super.initState();
    newClass = new SelectedClass(widget.Class);
    newGearPiece = new SelectedGearPiece(widget.GearPiece);
    newLevel = int.tryParse(widget.Level);
    newItemLevel = int.tryParse(widget.Filter);
    GearCalculated = fetchGear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Gear>(
          future: GearCalculated,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData) {
              return Container();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data.results.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "No results found. Try changing the Item Level or Level",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                  ),
                ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.results.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image(
                            image: AssetImage(
                                'assets' + snapshot.data.results[index].icon)),
                        title: Text(
                          snapshot.data.results[index].name,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Icon(Icons.more_vert),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GearData(
                                    title: snapshot.data.results[index].name,
                                    result: snapshot.data.results[index])),
                          );
                        },
                      ),
                    );
                  });
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods
  }
}
