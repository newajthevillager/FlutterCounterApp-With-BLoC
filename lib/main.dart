import 'package:counter_app_bloc/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_ event.dart';
import 'counter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App With BLoC implementation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // BlocProvider will automatically handle disposing the bloc.
      home: BlocProvider<CounterBloc>(
        builder: (context) => CounterBloc(), // so that CounterBloc is available down the tree
        child: HomePage(),
      )
    );
  }
}

// instead of stateful widget, its stateless widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter with BLoC 0.21.0"),
        centerTitle: true,
      ),
      /**
       * BlocBuilder needs builder and a bloc
       * bloc can be ommitted,. then BlocBuilder will automatically perform a lookup
       * using BlocProvider and the current BuildContext.
       */
      body: BlocBuilder<CounterBloc, int>( // bloc & state
        builder: (context, data) { // context & currentState
          return Center(
            child: Text("$data", style: TextStyle(
              fontSize: 20.0,
              color: Colors.orange,
            ),),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.dispatch(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}


