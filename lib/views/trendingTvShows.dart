import 'package:flutter/material.dart';
import '../widgets/category/categoryImageWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<Element> fetchPost() async {
    final response = await http.get('https://api.themoviedb.org/3/trending/tv/week?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US');

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
        return Element(
            results: json["results"],
        );
    }

}

class TrendingTvShows extends StatelessWidget {
    TrendingTvShows() {
        element = fetchPost();
    }
    Future<Element> element;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child: FutureBuilder<Element>(
                    future: element,
                    builder: (context, snapshot) {
                        debugPrint(snapshot.toString());
                        if (snapshot.hasData) {
                            return SingleChildScrollView(
                                child: Center(
                                child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children:
                                snapshot.data.results.map((element) {
                                    return CategoryImage(
                                        element,
                                        element["poster_path"],
                                        element["name"],
                                        "tv"
                                    );
                                }).toList()
                            )
                            )
                        );

                        } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator();
                    },
                ),

            )
        );
    }
}

