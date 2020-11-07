import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Dados Usuário.')
      ),
      body: Tab(),
    );
  }
}