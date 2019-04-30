import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../movieRelatedWidget.dart';
import 'dart:async';
import 'dart:convert';


class RelatedMedias extends StatelessWidget {
    RelatedMedias(List<dynamic> data) {
        this.data = data;
    }

    List<dynamic> data;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Text(
                        "Related",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                    ),
                    ConstrainedBox(
                        constraints: new BoxConstraints(
                            minHeight: 35.0,
                            maxHeight: 210.0,
                        ),
                        child:  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true, //just set this property
                            itemBuilder: (_, int index) => MovieRelated(
                                data[index],
                                'tv'
                            ),
                            itemCount: data.length,

                        )
                    )


                ],
            ),
        );
    }
}