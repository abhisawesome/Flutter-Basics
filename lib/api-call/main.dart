import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;

class APICALL extends StatefulWidget {
  @override
  _APICALLState createState() => _APICALLState();
}

class _APICALLState extends State<APICALL> {
  bool isLoading = false;
  List data;
  Future<List> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/albums';
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        setState(() {
          isLoading = false;
          data = jsonResponse;
        });
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      // throw e;
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API calls'),
      ),
      body: Container(
        child: Loader(isLoading, data),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  bool isLoading = false;
  List data;
  Loader(isLoading, data) {
    this.isLoading = isLoading;
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    if (this.isLoading == true) {
      return Text('Loading');
    }
    return data.length == 0
        ? Center(
            child: Text('No item'),
          )
        : ListView.separated(
            padding: EdgeInsets.all(20),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.amber[600],
                child: Text(data[index]['title']),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return new Divider();
            },
            itemCount: data.length);
  }
}
