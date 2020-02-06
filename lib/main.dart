import 'package:flutter/material.dart';
// import de todos os widgets do material design

void main() {
  runApp(MaterialApp(
      title: 'Contador de pessoas',
      home: Home()
      // home: Container(color: Colors.white)
      // parametros opcionais
      ));
  // dentro de runApp temos que passar um widget que seja o nosso proprio app
  // new MaterialApp() ou MaterialApp()
}

// criando um widget stateful
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // criando a variavel people com underline para que ela nao seja acessada de fora, apenas dentro desse escopo
  int _people = 0;
  String _infoText = 'Pode entrar!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0) {
        _infoText = 'Errrrrrrrou';
      } else if(_people <= 10) {
        _infoText = 'Pode entrar!';
      } else {
        _infoText = 'Lotado :(';
      }
    });
  }

  // essa funcao build e chamada sempre que queremos modificar algo no nosso layout
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant.jpg',
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_people',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            _changePeople(1);
                          },
                          child: Text(
                            '+1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ))),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            _changePeople(-1);
                          },
                          child: Text(
                            '-1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ))),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0),
              ),
            ],
          )
        ],
      );
  }
}