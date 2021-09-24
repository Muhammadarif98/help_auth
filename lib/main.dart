import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'global/components/phone_field/data/countries.dart';
import 'global/components/phone_field/phone_field.dart';
import 'screens/home_screen.dart';
import 'global/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appName, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  get initialCountryCode => null;

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  bool isButtonEnabled = false;
  late List<Map<String, dynamic>> _countryList;
  late Map<String, dynamic> _selectedCountry;

  final textEditingController = TextEditingController();

  void _routeToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
            value: '+${_selectedCountry['dial_code']}' +
                textEditingController.text),
      ),
    );
  }

  void setCountry(int index) {
    setState(() => _selectedCountry = _countryList[index]);
    Navigator.pop(context);
  }

  @override
  void initState() {
    _countryList = countries;
    _selectedCountry = _countryList.firstWhere(
      (item) => item['code'] == (widget.initialCountryCode ?? 'RU'),
      orElse: () => _countryList.first,
    );
    super.initState();
    textEditingController.addListener(() {
      if (textEditingController.text.length == 10) {
        setState(() {});
      } else if (textEditingController.text.length <= 18) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: PhoneFieldModule(
            controller: textEditingController,
            keyboardType: TextInputType.phone,
          ),
        ),
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 56, left: 16, right: 16),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: textEditingController.text.length == 10
                      ? () {
                          _routeToHomeScreen();
                        }
                      : null,
                  disabledColor: Colors.grey,
                  height: 52,
                  minWidth: double.infinity,
                  child: Text(
                    "Получить код",
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
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
      ],
    );
  }
}
