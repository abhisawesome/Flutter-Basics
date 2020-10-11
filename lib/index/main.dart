import 'package:sample/slider/main.dart';

import '../stateful-widget/main.dart';
import 'package:flutter/material.dart';
import '../scafold/main.dart';
import '../slider/main.dart';
import '../bottom-navigation-bar/main.dart';
import '../drawer/main.dart';
import '../switch/main.dart';
import '../api-call/main.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final listItem = [
    'Stateful widget',
    'Scaffold with snack bar',
    'Slider',
    'Bottom Navigation bar',
    'Drawer',
    'Switch',
    'API Calls'
  ];
  final mapNavigation = {
    0: TestState(),
    1: ScaffoldBody(),
    2: CustomSlider(),
    3: BottomBar(),
    4: DrawerDemo(),
    5: SwitchDemo(),
    6: APICALL()
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tutorial'),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[600],
                child: RaisedButton(
                  color: Colors.amber[600],
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return mapNavigation[index];
                    }));
                  },
                  child: Text('${listItem[index]}'),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: listItem.length));
  }
}
