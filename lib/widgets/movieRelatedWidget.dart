import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MovieRelated extends StatelessWidget {
    MovieRelated(String imageUrl, String name) {
        this.imageUrl = imageUrl;
        this.name = name;
    }

    String imageUrl;
    String name;

    @override
    Widget build(BuildContext context) {

        String imgUrl = "https://i.stack.imgur.com/34AD2.jpg";
        if(this.imageUrl != null) {
            imgUrl = "http://image.tmdb.org/t/p/w500" + this.imageUrl;
        }

        return Container(
            width: 100.0,
            padding: EdgeInsets.all(5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                    Container(
                        width: 100.0,
                        height: 120.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    imgUrl)
                            )
                        )),
                    Text(this.name,
                        textScaleFactor: 1.0)
                ],
            )
        );
    }
}