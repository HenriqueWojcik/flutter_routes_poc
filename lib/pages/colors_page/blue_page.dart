import 'package:flutter/material.dart';
import 'package:flutter_routes_poc/nav.dart';
import 'package:flutter_routes_poc/routes.gr.dart';

class BluePage extends StatefulWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  _BluePageState createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Blue"),
      ),
      body: Center(
        child: TextButton(
          key: Key("btn_pop"),
          onPressed: _onClickPopUntil,
          child: Text(
            "Pop until red",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onClickPopUntil() {
    navHelper.popUntil(RedPageRoute.name);
  }
}
