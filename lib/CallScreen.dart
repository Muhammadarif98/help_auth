import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const CallScreen());
class CallScreen extends StatelessWidget
{
  const CallScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Специалисты online';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/specialist.svg'),
              Text(appTitle,
                style: TextStyle(
                    color: Colors.black
                )
            ),

         ]
        ),
        backgroundColor:Colors.white,
        centerTitle: true,
      ),
      body: const CallForm(),
    );
  }
}
class CallForm extends StatefulWidget {

  const CallForm({Key key}) : super(key: key);

  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<CallForm>{
  @override
  Widget build(BuildContext context) {

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
          ]
      );
  }
}