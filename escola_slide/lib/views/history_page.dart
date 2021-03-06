import 'package:escola_slide/events/authentication_event.dart';
import 'package:flutter/material.dart';

import 'package:escola_slide/blocs/authentication_bloc.dart';
import 'package:escola_slide/views/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
          child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Nome Usuario'),
            accountEmail: new Text('usuario@mail.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'https://lh6.googleusercontent.com/-tY93ZPWX1vg/AAAAAAAAAAI/AAAAAAAABig/iTd8WpTMB34/photo.jpg'),
            ),
          ),
          new ListTile(
              title: new Text('Configurações Usuário'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new UserPage()));
              }),
          new Divider(
            color: Theme.of(context).accentColor,
            height: 5.0,
          ),
          new ListTile(
              title: new Text('Sair'),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              })
        ],
      )),
      body: Center(child: Text('Ta aqui seu cartao')),
    );
  }
}
