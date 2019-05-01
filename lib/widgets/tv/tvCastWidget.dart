import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../castWidget.dart';
import 'dart:async';
import 'dart:convert';

class TvCast extends StatelessWidget {
    TvCast(String type, List<dynamic> data) {
        this.data = data;
        this.type = type;
    }

    List<dynamic> data;
    String type;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Text(
                        this.type,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                    ),
                     ConstrainedBox(
                        constraints: new BoxConstraints(
                            minHeight: 35.0,
                            maxHeight: 120.0,
                        ),
                        child:  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true, //just set this property
                            itemBuilder: (_, int index) => Cast(
                                data[index],
                                isCast: type != "Creators"
                            ),
                            itemCount: data.length,

                        )
                     )
                ],
            )
        );
    }
}