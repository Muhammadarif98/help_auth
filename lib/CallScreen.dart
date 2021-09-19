import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const CallScreen());

class CallScreen extends StatelessWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CallForm(),
    );
  }
}

class CallForm extends StatefulWidget {
  const CallForm({Key key}) : super(key: key);

  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<CallForm> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    const appTitle = '  Специалисты online';
    return new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset('assets/specialist.svg'),
            Text(appTitle, style: TextStyle(color: Colors.black)),
          ]),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 155,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.grey[200])),
                    margin: const EdgeInsets.only(
                        top: 40, bottom: 16, right: 16, left: 16),
                    child: Center(
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12, right: 12),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset('assets/help.svg')),
                        ),
                        SvgPicture.asset('assets/video.svg'),
                        const SizedBox(
                          width: 16.0,
                          height: 16.0,
                        ),
                        Text('Сделать видеозвонок специалисту')
                      ]),
                    ),
                  ),
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.grey[200])),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 24, right: 16, left: 16),
                    child: Center(
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12, right: 12),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset('assets/help.svg')),
                        ),
                        SvgPicture.asset('assets/call.svg'),
                        const SizedBox(
                          width: 16.0,
                          height: 16.0,
                        ),
                        Text('Сделать  аудиозвонок специалисту')
                      ]),
                    ),
                  ),
                  Container(
                    height: 87,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.grey[200])),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 16, right: 16, left: 16),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 12, bottom: 8),
                          child: SvgPicture.asset('assets/sos.svg')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('запрос на звонок'),
                          SvgPicture.asset('assets/phone.svg')
                        ],
                      ),
                    ]),
                  ),
                ]),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[300],
        onTap: _onItemTapped,
      ),);
  }
}
