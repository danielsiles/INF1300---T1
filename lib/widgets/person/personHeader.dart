import 'package:flutter/material.dart';
import '../../widgets/posterWidget.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:async';
import 'dart:convert';


class PersonHeader extends StatelessWidget {
    PersonHeader(Map<String, dynamic> data) {
        this.data = data;
    }

    Map<String, dynamic> data;
    Future<Element> element;

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
            Container(
            height: 210,
            padding: EdgeInsets.all(15),
            child: Center(
                child: Row(
                    children: [
                        Poster(
                            "http://image.tmdb.org/t/p/w185/" + data["profile_path"],
                            height: 180.0,
                        ),

                        Expanded(
                            child: Center(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            data["name"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),
                                        ),
                                        Text(
                                            data["birthday"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14
                                            ),
                                        ),
                                        Text(
                                            data["place_of_birth"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14
                                            ),
                                        ),
                                        Text(
                                            data["known_for_department"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14
                                            ),
                                        ),
                                        SizedBox(height: 8.0),
                                        SizedBox(height: 12.0),
                                    ],
                                ),
                            )
                        )
                    ],
                ),
            )
        )

            ],
        );
    }
}