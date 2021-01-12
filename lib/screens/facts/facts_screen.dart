// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dimo/screens/facts/index.dart';

// class FactsScreen extends StatefulWidget {
//   const FactsScreen({
//     Key key,
//     @required FactsBloc factsBloc,
//   })  : _factsBloc = factsBloc,
//         super(key: key);

//   final FactsBloc _factsBloc;

//   @override
//   FactsScreenState createState() {
//     return FactsScreenState();
//   }
// }

// class FactsScreenState extends State<FactsScreen> {
//   FactsScreenState();

//   @override
//   void initState() {
//     super.initState();
//     _load();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FactsBloc, FactsState>(
//         cubit: widget._factsBloc,
//         builder: (
//           BuildContext context,
//           FactsState currentState,
//         ) {
//           if (currentState is UnFactsState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (currentState is ErrorFactsState) {
//             return Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(currentState.errorMessage ?? 'Error'),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 32.0),
//                   child: RaisedButton(
//                     color: Colors.blue,
//                     child: Text('reload'),
//                     onPressed: _load,
//                   ),
//                 ),
//               ],
//             ));
//           }
//            if (currentState is InFactsState) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(currentState.hello),
//                   Text('Flutter files: done'),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 32.0),
//                     child: RaisedButton(
//                       color: Colors.red,
//                       child: Text('throw error'),
//                       onPressed: () => _load(true),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return Center(
//               child: CircularProgressIndicator(),
//           );
          
//         });
//   }

//   void _load([bool isError = false]) {
//     widget._factsBloc.add(LoadFactsEvent(isError));
//   }
// }
