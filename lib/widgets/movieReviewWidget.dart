import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MovieReview extends StatelessWidget {
    MovieReview(String author, String content) {
        this.author = author;
        this.content = content;
    }

    String author;
    String content;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                    Text(this.author,textScaleFactor: 1.2),
                    Text(this.content)
                ],
            )
        );
    }
}