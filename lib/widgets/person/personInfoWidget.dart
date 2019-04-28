import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
    PersonInfo(Map<String, dynamic> data) {
        this.data = data;
    }

    Map<String, dynamic> data;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Biography", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        )),
                    ),
                    Text(data["biography"])
                ],
            ),
        );


    }
}