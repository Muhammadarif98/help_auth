import 'dart:async';

import 'package:flutter/material.dart';
import 'package:help_auth/CallScreen.dart';
// import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'main.dart';

void main() => runApp(HomeScreen(value: '',));

class HomeScreen extends StatefulWidget {
  final String value;

  HomeScreen({Key? key, required this.value}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState(value: '');


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: HomeScreen(value: '',),
    );
  }
}

class MyForm extends StatefulWidget {
  MyForm({
    Key? key,
  }) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState(value: '');
}

class _MyFormState extends State<HomeScreen> {
  String value;

  _MyFormState({Key? key, required this.value});

 late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var code = '1234';
    const appTitle = 'Авторизация';
    return new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(appTitle, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 0, bottom: 16),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Введите код',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Мы отправили вам код на номер',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 0, bottom: 0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "${widget.value}",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    ),
                  ),
                  Container(
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' (изменить)',
                        style: TextStyle(fontSize: 14, color: Colors.grey),

                      ),
                    ),
                  ),
                ]),
          ),
          // PinEntryTextField(
          //   onSubmit: (String pin) {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: Text("Код смс"),
          //             content: Text('правильный код 1234'),
          //             actions: <Widget>[
          //               FlatButton(
          //                   child: Text('Отмена'),
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   }),
          //               FlatButton(
          //                 child: Text('Далее'),
          //                 onPressed: '$pin'.toString() == code
          //                     ? () {
          //                         Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: (context) =>
          //                                     const CallScreen()));
          //                       }
          //                     : null,
          //               )
          //             ],
          //           );
          //         }); //end showDialog()
          //   }, // end onSubmit
          // ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 32, bottom: 0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Выслать код повторно через:',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 8, bottom: 0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "$_start",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
          ),
        ]));
  }
}
