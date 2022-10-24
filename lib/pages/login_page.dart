import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lect1_page_authorization/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = '';
  String password = '';
  bool _isChecked = false;
  //Open Hive box
  final authBox = Hive.box('authorizationBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вхід'),
      ),
      body: Center(
        child: SizedBox(
          width: 350.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Login field
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: (const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введіть логін',
                )),
                onChanged: (val) => login = val,
              ),
              const SizedBox(
                height: 16,
              ),
              // Password field
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: (const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введіть пароль',
                )),
                onChanged: (val) => password = val,
              ),
              const SizedBox(
                height: 30,
              ),
              //Checkbox and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 190,
                      child: CheckboxListTile(
                        title: const Text('Запамʼятати'),
                        value: _isChecked,
                        onChanged: (newValue) {
                          setState(() => _isChecked = newValue!);
                        },
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                      onPressed: () {
                        checkData();
                      },
                      child: const Text("Далі",
                          style: TextStyle(fontSize: 18, color: Colors.white)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //Alert dialog
  showAlertDialog() {
    // Set up button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
    // Set up AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Помилка"),
      content: const Text('Помилка в логіні або паролі'),
      actions: [
        okButton,
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Checking function
  void checkData() {
    if (login == 'admin' && password == '123456') {
      if (_isChecked == true) {
        //change authorization status
        authBox.put(0, true);
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomePage()));
    } else {
      showAlertDialog();
    }
  }
}
