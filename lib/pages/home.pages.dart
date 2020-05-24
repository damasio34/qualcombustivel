import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:qualcombustivel/widgets/logo.widget.dart';
import 'package:qualcombustivel/widgets/submit-form.widget.dart';
import 'package:qualcombustivel/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, //Obtendo cor primária
      body: ListView(
        children: <Widget>[
          Logo(),
          this._completed
            ?  Success(
                result: this._resultText,
                reset: reset
              )
            : SubmitForm(
              gasCtrl: this._gasCtrl,
              alcCtrl: this._alcCtrl,
              busy: this._busy,
              submitFunc: calculate,
            )
        ]
      )
    );
  }

  Future calculate(){
    double alc = 
      double.parse(this._alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas = 
      double.parse(this._gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      this._completed = false;
      this._busy = true;    
    });

    return new Future.delayed(
      const Duration(seconds: 1), () {
        setState(() {
          if (res > 0.7) {
            this._resultText = "Compensa utilizar Gasolina!";
          } else {
            this._resultText = "Compensa utilizar Álcool!";
          }
        
          this._completed = true;
          this._busy = false;    
        });
      });
  }

  reset(){
    setState(() {
      this._alcCtrl = new MoneyMaskedTextController();
      this._gasCtrl = new MoneyMaskedTextController();
      this._completed = false;
      this._busy = false;
    });
  }
}