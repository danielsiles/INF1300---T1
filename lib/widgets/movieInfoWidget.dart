import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
    MovieInfo(Map<String, dynamic> data) {
        this.data = data;
    }

    Map<String, dynamic> data;

    @override
    Widget build(BuildContext context) {
        return
                Column(
                    children: <Widget>[
                        Column(
                            children: <Widget>[
                                Text("Story Line"),
                                Text(data["overview"])
                            ],
                        )
                    ],
                );


    }
}