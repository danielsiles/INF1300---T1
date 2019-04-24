import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Cast extends StatelessWidget {
    Cast(String imageUrl, String name) {
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
            padding: EdgeInsets.all(10.0),
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
                        )),
                    Text(this.name,
                        textScaleFactor: 1.0)
                ],
            )
        );
    }
}