import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frete_facil/blocs/authentication_bloc.dart';
import 'package:frete_facil/events/authentication_event.dart';
import 'package:frete_facil/models/user_repository.dart';
import 'package:frete_facil/views/user_page.dart';

class PrincipalPage extends StatelessWidget {
  
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
                backgroundImage: new NetworkImage('https://lh6.googleusercontent.com/-tY93ZPWX1vg/AAAAAAAAAAI/AAAAAAAABig/iTd8WpTMB34/photo.jpg'),
              ),
            ),
            new ListTile(
              title: new Text('Configurações Usuário'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new UserPage())
                );
              }
            ),
            new Divider(
              color: Colors.blueGrey,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Sair'),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }
            )
          ],
        )
      ),
      body: Container(
        child: Center(
            child: Text('Bem Vindo, Nome Usuário!')
        ),
      ),
    );
  }
}