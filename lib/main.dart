import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
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
  _ExampleMask({ @required this.formatter, this.validator, @required this.hint });
}
class MyCustomForm extends StatelessWidget {
  const MyCustomForm({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    var maskFormatter = new MaskTextInputFormatter(mask: "+7 (###) ###-##-##",
      filter: { "#": RegExp(r'[0-9]') },);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 50,left: 72,right: 72),
            child: Text(
                'Введите ваш номер телефона',
            style: new TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            ),
            ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24,bottom: 24,left: 24,right: 24),
            child: TextFormField(
              controller: textEditingController,
              inputFormatters: [maskFormatter,
                LengthLimitingTextInputFormatter(21),],
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.always,
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
          margin: const EdgeInsets.only(top: 0,bottom: 56),
          child: Center(
            child :MaterialButton(
            child: Text("Получить код",
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),),
            onPressed: () {},
            height: 52,
            minWidth: 315,
            color: Colors.grey,
          ),)
        ),
        Container(
          margin: const EdgeInsets.only(top: 1,left: 12,right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/apple.svg'),
              SvgPicture.asset('assets/vk.svg'),
              SvgPicture.asset('assets/google.svg'),
            ],
          ),
        ),
      ]
    );
  }

  @override
  Widget text (BuildContext context){
    return Column(
      children: <Widget>[

      ],
    );
  }
}