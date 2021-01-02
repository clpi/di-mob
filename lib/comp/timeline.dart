import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:dimo/models/fact/fact.dart';

const facts = <FactCard>[
  FactCard(fact: Fact(
    name: "Fact 1",
    value: "True",
    notes: "First fact"
  )),
  FactCard(fact: Fact(
    name: "Fact 2",
    value: "False",
    notes: "Second fact",
  ))
];

class Timeline extends StatelessWidget {
  const Timeline({Key key, this.fact}) : super(key: key);

  final FactCard fact;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF004e92), Color(0xFF000428)])),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: <Widget>[
                          Text(fact.fact.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 32, color: Colors.white)),
                          const SizedBox(height: 16),
                          Expanded(
                              child: CustomScrollView(
                                slivers: <Widget>[
                                  SliverList(
                                    delegate: SliverChildListDelegate(<Widget>[
                                      _Description(
                                        description: fact.fact.value,
                                        code: fact.fact.notes,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Vert axis',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      const SliverPadding(padding: EdgeInsets.only(top: 20)),
                                      fact.childVertical,
                                      const SliverPadding(padding: EdgeInsets.only(top: 20)),
                                      SliverList(
                                        delegate: SliverChildListDelegate(
                                          <Widget>[
                                            const Text(
                                              'Horizontal axis',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 24),
                                            )
                                          ]
                                        )
                                      ),
                                      const SliverPadding(padding: EdgeInsets.only(top: 20)),
                                      fact.childHorizontal,
                                      const SliverPadding(padding: EdgeInsets.only(top: 20)),
                                    ]),
                                  )
                          ]))
                        ]))))));
  }
}

class _TimelineTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF004e92), Color(0xFF000428)])),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                    child: Column(children: <Widget>[
                  const SizedBox(height: 16),
                  const Text('Timeline',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 16),
                  Expanded(child: ListView.builder(
                    itemCount: facts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final fact = facts[index];
                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.1,
                        isFirst: index == 0,
                        isLast: index == facts.length - 1,
                        indicatorStyle: IndicatorStyle(
                          width: 40,
                          height: 40,
                          indicator: _Indicator(number: '${index + 1}'),
                          drawGap: true,
                        ),
                        beforeLineStyle: LineStyle( color: Colors.white.withOpacity(0.2)),
                        endChild: GestureDetector(
                          child: _Row(fact: fact),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Timeline>(
                                builder: (_) => Timeline(fact: fact),
                              ),
                            );
                          }
                        ),
                      );
                    }))
                ])))));
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key key,
    this.description,
    this.code,
  }) : super(key: key);

  final String description;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              description,
              style: GoogleFonts.jura(fontSize: 18),
            ),
          ),
          Theme(
              data: Theme.of(context).copyWith(
                accentColor: Colors.purpleAccent,
                dividerColor: Colors.transparent,
                unselectedWidgetColor: Colors.white,
              ),
              child: ExpansionTile(
                  title: Text(
                    '</> SOURCE CODE',
                    style: GoogleFonts.lato(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  children: <Widget>[
                    _Code(code: code),
                    OutlineButton(
                        child: Text(
                          'FULL SCREEN',
                          style: GoogleFonts.lato(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.7), width: 2),
                        onPressed: () {
                          showCodeDialog(context);
                        }
                    )
                  ]
              )
          )
        ])
    );
  }

  void showCodeDialog(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: _Code(code: code),
          )
        );
      }
    );
  }
}

class _Code extends StatelessWidget {
  const _Code({Key key, this.code}) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return Text(
      code,
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({Key key, this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          )
        )
      ),
      child: Center(
        child: Text(number, style: TextStyle(fontSize: 30),)
      )
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({Key key, this.fact}) : super(key: key);

  final FactCard fact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              fact.fact.name,
              style: GoogleFonts.jura(
                color: Colors.white,
                fontSize: 18
              ),
            )
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ]
      )
    );
  }
}
