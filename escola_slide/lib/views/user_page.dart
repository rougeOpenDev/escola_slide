import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:escola_slide/models/managers/user_manager.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (_, userManager, __) {
      final user = userManager.user;

      if (userManager.loading) {
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        );
      }

      final name = user.name;

      return new Scaffold(
        appBar: new AppBar(title: Text('Dados Usuário $name')),
      );
    });
  }
}
