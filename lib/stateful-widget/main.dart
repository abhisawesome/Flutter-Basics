import 'package:flutter/material.dart';

class TestState extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<TestState> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('You have pressed $counter times...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            counter += 1;
          })
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
