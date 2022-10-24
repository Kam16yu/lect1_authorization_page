import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Unlogin button
        appBar: AppBar(actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {
              //Open Hive box
              final authBox = Hive.box('authorizationBox');
              //change authorization status
              authBox.put(0, false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
            },
            child: const Text('Вихід'),
          )
        ]),
        body: const Center(child: Text('Вітаю!')));
  }
}
