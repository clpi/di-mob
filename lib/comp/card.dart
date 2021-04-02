import 'package:flutter/foundation.dart';
import 'package:dimo/models/record/record.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}
class DlCard extends Card {

  @override
  Widget build(BuildContext context) {
  return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: const Text('Card title 1'),
                        subtitle: Text(
                          'Secondary Text',
                          style: TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style: TextStyle(color: Colors.white.withOpacity(0.65)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            textColor: const Color(0xFFFFFFFF),
                            onPressed: () {
                            },
                            child: const Text('ACTION 1'),
                            color: Colors.black26
                          ),
                          FlatButton(
                            textColor: const Color(0xFFFFFFFF),
                            color: Colors.black26,
                            onPressed: () {
                            },
                            child: const Text('ACTION 2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
  }
}

class RecCard extends StatelessWidget {
  final Record record;
  RecCard({this.record});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        FlutterIcons.favorite_mdi,
                        color: this.record.starred
                            ? Colors.deepOrangeAccent
                            : Colors.white
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15.0,
                  left: 10.0,
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: this.record.private == true
                          ? Colors.deepPurpleAccent
                          : Colors.deepPurple,
                    ),
                    child: Center(
                      child: Text(
                        this.record.private == false
                            ? "Public"
                            : "Private",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        record.name,
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    Text(
                      "Record",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  record.descr,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xFF343434),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Icon(
                      FlutterIcons.map_pin_fea,
                      size: 15.0,
                      color: Color.fromRGBO(255, 136, 0, 1),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Created at",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF343434),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}