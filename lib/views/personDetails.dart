import 'package:flutter/material.dart';
import '../widgets/person/personHeader.dart';
import '../widgets/person/personInfoWidget.dart';
import '../widgets/combinedRelatedWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Element> fetchPost(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/person/' + query.toString() + '?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return Element.fromJson(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

Future<Element> fetchPostMovies(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/person/' + query.toString() + '/combined_credits?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        debugPrint(json.decode(response.body).toString());
        return Element.fromJsonMovies(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

class Element {
    final Map<String, dynamic> results;
    final List<dynamic> movies;

    Element({this.results, this.movies});

    factory Element.fromJson(Map<String, dynamic> json) {
        return Element(
            results: json,
        );
    }

    factory Element.fromJsonMovies(Map<String, dynamic> json) {
        return Element(
            movies: json["cast"],
        );
    }
}

class PersonDetails extends StatelessWidget {
    PersonDetails(Map<String, dynamic> data) {
        this.data = data;
        element = fetchPost(data["id"]);
        elementMovie = fetchPostMovies(data["id"]);
    }

    Map<String, dynamic> data;
    Future<Element> element;
    Future<Element> elementMovie;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(data["name"]),
            ),
            body: FutureBuilder<Element>(
                    future: element,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return ListView(
                                children: <Widget>[
                                    PersonHeader(snapshot.data.results),
                                    PersonInfo(snapshot.data.results),
                                    FutureBuilder<Element>(
                                        future: elementMovie,
                                        builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                                  return CombinedRelated(snapshot.data.movies);
                                            } else if (snapshot.hasError) {
                                                return Text("${snapshot.error}");
                                            }

                                            return CircularProgressIndicator();
                                        },
                                    ),
                                ],
                            );

                        } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator();
                    },
                ),
        );
    }
}

