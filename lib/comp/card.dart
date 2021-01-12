import 'package:flutter/foundation.dart';
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