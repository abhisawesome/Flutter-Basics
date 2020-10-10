import 'package:flutter/material.dart';

class MyScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('SHOW A SNACKBAR'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Have a snack!'),
            ),
          );
        },
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyScaffoldBody(),
      appBar: AppBar(
        title: Text('Sample title'),
      ),
    );
  }
}
