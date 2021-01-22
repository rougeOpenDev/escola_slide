import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Dados Usuário.')
      ),
    );
  }
}