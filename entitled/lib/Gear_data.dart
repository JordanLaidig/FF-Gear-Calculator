import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:entitled/Gear_Classes.dart";

class GearData extends StatefulWidget {
  final String title;
  final Results result;
  String counted;

  GearData({Key key, this.title, @required this.result}) : super(key: key);

  @override
  _GearDataState createState() => _GearDataState();
}

class _GearDataState extends State<GearData> {
  Future<ItemData> ItemCalculated;

  Future<ItemData> fetchGear() async {
    final response = await http.get('https://xivapi.com${widget.result.url}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ItemData.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load gear');
    }
  }

  @override
  void initState() {
    super.initState();
    widget.counted = "0";
    ItemCalculated = fetchGear();
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
        child: FutureBuilder<ItemData>(
          future: ItemCalculated,
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
                snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 10.0, left: 60.0),
                        child: Image.asset("assets" + snapshot.data.icon,
                            scale: 0.5),
                      ),
                      Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, right: 10.0),
                                child: Visibility(
                                  child: Text(
                                    "Unique",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                    ),
                                  ),
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: snapshot.data.isUnique == 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, right: 10.0),
                                child: Visibility(
                                  child: Text(
                                    "Untradeable",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                    ),
                                  ),
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: snapshot.data.isUntradable == 1,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 10.0),
                            child: Text(
                              snapshot.data.name,
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 10.0),
                            child: Text(
                              snapshot.data.itemUICategory.name,
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Item Level ${snapshot.data.levelItem}",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 10.0),
                            child: buildDamageParameter(snapshot.data),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 10.0),
                            child: buildDamageParameterStat(snapshot.data),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 10.0),
                            child: buildDefenseParameter(snapshot.data),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: buildDefenseParameterStat(snapshot.data),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "${snapshot.data.classJobCategory.name}",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Lv ${snapshot.data.levelEquip}",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Bonuses",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 10.0),
                            child: buildMainStat(snapshot.data),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, left: 10.0),
                            child: Text(
                              "Vitality +${snapshot.data.stats.vitality.nQ}",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, right: 10.0),
                              child: Text(
                                (widget.counted = buildSubStat(
                                    snapshot.data, widget.counted)),
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                ),
                              )),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, left: 10.0),
                              child: Text(
                                buildSubStat(snapshot.data, widget.counted),
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10.0, right: 5.0),
                        child: Text(
                          "Materia Slots: ${snapshot.data.materiaSlotCount}",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 5.0, right: 5.0),
                        child: Text(
                          "HQ possible: " +
                              ((snapshot.data.canBeHq == 1) ? "Yes" : "No"),
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 5.0, right: 10.0),
                    child: Text(
                      "Able to be discarded: " +
                          ((snapshot.data.isIndisposable == 0) ? "Yes" : "No"),
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10.0, right: 5.0),
                        child: Text(
                          "Dyeable: " +
                              ((snapshot.data.isDyeable == 1) ? "Yes" : "No"),
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 5.0, right: 5.0),
                        child: Text(
                          "Crest Worthy: " +
                              ((snapshot.data.isCrestWorthy == 1)
                                  ? "Yes"
                                  : "No"),
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 5.0, right: 10.0),
                    child: Text(
                      "Glamourable: " +
                          ((snapshot.data.isGlamourous == 1) ? "Yes" : "No"),
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 5.0, right: 10.0),
                    child: Text(
                      "Advanced Melding " +
                          ((snapshot.data.isAdvancedMeldingPermitted == 1)
                              ? "Allowed"
                              : "Forbidden"),
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
