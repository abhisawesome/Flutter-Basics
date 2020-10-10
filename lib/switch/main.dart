import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  @override
  Color backgroudColor = Colors.white;
  bool switchValue = false;
  void onChangeSwitch(bool newValue) {
    setState(() {
      switchValue = newValue;
      print((newValue == true));
      if (newValue == true) {
        backgroudColor = Colors.black12;
      } else {
        backgroudColor = Colors.white;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroudColor,
        body: Center(
          child: Switch(
            value: switchValue,
            onChanged: onChangeSwitch,
          ),
        ));
  }
}
