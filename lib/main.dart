
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Авторизация';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class _ExampleMask {
  final TextEditingController textController = TextEditingController();
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String> validator;
  final String hint;

  _ExampleMask({@required this.formatter, this.validator, @required this.hint});
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  bool _isButtonDisabled;
  var _onPressed;

  var textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() {
      if (textEditingController.text.length == 18) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    var maskFormatter = new MaskTextInputFormatter(
      mask: "+7 (###) ###-##-##",
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 0, left: 72, right: 72),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Введите ваш номер телефона',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: TextFormField(
              autovalidate: true,
              controller: textEditingController,
              inputFormatters: [
                maskFormatter,
                LengthLimitingTextInputFormatter(18),
              ],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: '',
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 56, left: 16, right: 16),
              child: Column(
                children: [
                  MaterialButton(
                    disabledColor: Colors.grey,
                    child: Text(
                      "Получить код",
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white70,
                      ),
                    ),
                    onPressed: textEditingController.text.length == 18
                        ? () {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                        : null,
                    height: 52,
                    minWidth: double.infinity,
                    color: Colors.black,
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset('assets/apple.svg'),
                SvgPicture.asset('assets/vk.svg'),
                SvgPicture.asset('assets/google.svg'),
              ],
            ),
          ),
        ]);
  }
}
