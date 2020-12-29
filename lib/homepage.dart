import 'package:flutter/material.dart';
import 'package:love_calc/Services/love_service.dart';

import 'models/love.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController boyController = TextEditingController();

  TextEditingController girlController = TextEditingController();

  String percentage = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 550,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 3,
                color: Colors.black38,
                offset: Offset(5, 5),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: boyController,
                  decoration: InputDecoration(hintText: "Gentleman's name"),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: girlController,
                  decoration: InputDecoration(hintText: "Lady's name"),
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    final Love response = await calculateLove(
                        boyController.text, girlController.text);
                    setState(() {
                      percentage = response.percentage;
                      _isLoading = false;
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(_isLoading ? "Please wait..." : percentage,style: TextStyle(fontSize: 25, color: Colors.pink),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
