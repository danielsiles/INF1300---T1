import 'package:flutter/material.dart';
import '../views/personDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Cast extends StatelessWidget {
    Cast(Map<String, dynamic> data, {bool isCast = true}) {
        this.data = data;
        this.isCast = isCast;
    }

    Map<String, dynamic> data;
    String imgUrl;
    bool isCast;

    @override
    Widget build(BuildContext context) {

        String imgUrl = "https://i.stack.imgur.com/34AD2.jpg";
        if(this.data['profile_path'] != null) {
            imgUrl = "http://image.tmdb.org/t/p/w500" + this.data['profile_path'];
        }

        return GestureDetector(
            onTap: () {
                if(this.isCast) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonDetails(data)));
                }
            },
            child: Container(
                padding: EdgeInsets.only( right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                        Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,

                                image: new DecorationImage(

                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        imgUrl)
                                )
                            )
                        ),
                        Text(this.data['name'],
                            textScaleFactor: 1.0)
                    ],
                )
            )
        );
    }
}