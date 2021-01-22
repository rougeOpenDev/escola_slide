import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:escola_slide/blocs/authentication_bloc.dart';
import 'package:escola_slide/events/authentication_event.dart';
import 'package:escola_slide/views/history_page.dart';
import 'package:escola_slide/views/home_page.dart';
import 'package:escola_slide/views/user_page.dart';
import 'package:escola_slide/views/vistoria/nova_vistoria.dart';

class PrincipalPage extends StatefulWidget {
  _PrincipalPage createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), NovaVistoria(), HistoryPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.add_circle_outline),
              title: new Text("Nova Vistoria"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.history),
              title: new Text("Histórico"),
            )
          ]),
    );
  }
}
