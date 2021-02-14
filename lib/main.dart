import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:study/model/CardClass.dart';
import 'package:study/redux/reducers.dart';

import 'model/addCardCallback.dart';



void main() {

  final store = new Store<List<CardClass>>(
      appReducers,
      initialState: new List());

  runApp(new FlutterReduxApp(
    store: store,
  ));
}



class FlutterReduxApp extends StatelessWidget {
  final Store<List<CardClass>> store;

  FlutterReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<CardClass>>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        home: newFlutter()
      ),
    );
  }

}

class newFlutter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
          child: StoreConnector<List<CardClass>, List<CardClass>>(
            converter: (store) => store.state,
            builder: (context, list) {
              return new ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, position) =>
                    Container(
                        height: 100,
                        child: Text(list[position].title)),
              );
            },
          )

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
  void _openAddItemDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AddItemDialog());
  }

}