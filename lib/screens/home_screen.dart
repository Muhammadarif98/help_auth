import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'call_screen.dart';

class HomeScreen extends StatelessWidget {
  final String value;

  HomeScreen({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyForm(value: value),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
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
          Container(
            child: Padding(
                padding: EdgeInsets.only(left: 66.0, right: 66),
                child: PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  appContext: context,
                  length: 4,
                  enableActiveFill: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    fieldWidth: 40,
                    activeColor: Colors.black,
                    disabledColor: Colors.black,
                    inactiveColor: Colors.black,
                    selectedColor: Colors.black,
                  ),
                  onCompleted: (v) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Код смс"),
                            content: Text('правильный код 1234'),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('Отмена'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                              FlatButton(
                                child: Text('Далее'),
                                onPressed: '$v'.toString() == code
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CallScreen()));
                                      }
                                    : null,
                              )
                            ],
                          );
                        });
                  },
                  onChanged: (String pin) {
                    //end showDialog()
                  }, // end onSubmit
                )),
          ),
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
        ],
      ),
    );
  }
}
