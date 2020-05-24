import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:qualcombustivel/widgets/input.widget.dart';
import 'package:qualcombustivel/widgets/loading-button.widget.dart';
import 'package:qualcombustivel/widgets/logo.widget.dart';
import 'package:qualcombustivel/widgets/submit-form.widget.dart';
import 'package:qualcombustivel/widgets/success.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, //Obtendo cor primária
      body: ListView(
        children: <Widget>[
          Logo(),
          // Success(
          //   result: "Compensa utilizar X",
          //   reset: () {}
          // ),
          SubmitForm(
            gasCtrl: this._gasCtrl,
            alcCtrl: this._alcCtrl,
            busy: false,
            submitFunc: () {},
          )
        ]
      )
    );
  }
}