import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'movieReviewWidget.dart';
import 'dart:async';
import 'dart:convert';

Future<Element> fetchPost(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/movie/' + query.toString() + '/reviews?api_key=d7b753a5e3600c4cedca32ba02944de3');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return Element.fromJson(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

class Element {
    final List<dynamic> results;

    Element({this.results});

    factory Element.fromJson(Map<String, dynamic> json) {
        debugPrint(json.toString());
        return Element(
            results: json['results'],
        );
    }
}

class MovieReviews extends StatelessWidget {
    MovieReviews(Map<String, dynamic> data) {
        this.data = data;
        element = fetchPost(data["id"]);
    }

    Map<String, dynamic> data;
    Future<Element> element;

    @override
    Widget build(BuildContext context) {

        return
                FutureBuilder<Element>(
                    future: element,
                    builder: (context, snapshot) {
                        debugPrint(snapshot.toString());
                        if (snapshot.hasData) {
                            if(snapshot.data.results.length > 0) {
                                return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                        Text(
                                            "Reviews",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                            ),
                                        ),
                                        Container(child:
                                        Column(children:
                                        snapshot.data.results.map((element) =>
                                            MovieReview(
                                                element["author"],
                                                element["content"],
                                            )).toList()))
                                    ],
                                );
                            }
                            else {
                                return Container();
                            }
                        } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator();
                    },
                );



    }
}