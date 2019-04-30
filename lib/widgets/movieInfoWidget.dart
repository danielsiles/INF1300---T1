import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
    MovieInfo(Map<String, dynamic> data) {
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
                        child: Text("Story Line", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        )),
                    ),
                    Text(data["overview"])
                ],
            ),
        );


    }
}