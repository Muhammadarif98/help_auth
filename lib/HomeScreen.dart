import 'package:flutter/material.dart';
import 'package:help_auth/CallScreen.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

void main() => runApp(const HomeScreen());
class HomeScreen extends StatelessWidget
{
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Авторизация';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(appTitle,
            style: TextStyle(
                color: Colors.black
            )
        ),
        backgroundColor:Colors.white,
        centerTitle: true,
      ),
      body: const MyForm(),
    );
  }
}
class MyForm extends StatefulWidget {

  const MyForm({Key key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm>{
  @override
  Widget build(BuildContext context) {
    var code = '1234';
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 0,bottom: 16),
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
          margin: const EdgeInsets.only(top: 0,bottom: 0),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            children :[
            Container(
              child: Text(
                  '+7(963) 459 - 54 - 43',
                  style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                ),
            ),
            Container(
              child: Text(
                  '(изменить)',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

            ),
            ]
          ),
        ),
          PinEntryTextField(
            onSubmit: (String pin){
              showDialog(
                  context: context,
                  builder: (context){
                    return
                      AlertDialog(
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
                              onPressed: '$pin'.toString()== code?() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CallScreen())
                                );
                              }: null,)
                        ],
                    );
                  }
              ); //end showDialog()

            }, // end onSubmit
          ),
      ]
    );
  }
}