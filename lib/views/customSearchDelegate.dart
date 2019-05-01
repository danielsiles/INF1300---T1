import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import "movieDetails.dart";
import 'personDetails.dart';
import 'tvDetails.dart';

Future<Element> fetchPost(String query) async {
    final response = await http.get('https://api.themoviedb.org/3/search/multi?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US&query=' + query + '&include_adult=false');

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
//        debugPrint(json.toString());
        return Element(
            results: json['results'],
        );
    }
}

class CustomSearchDelegate extends SearchDelegate {

    Future<Element> element;

    @override
    List<Widget> buildActions(BuildContext context) {
        return [
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                    query = '';
                },
            ),
        ];
    }

    @override
    Widget buildLeading(BuildContext context) {
        return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {

                close(context, null);
            },

        );
    }

    @override
    Widget buildResults(BuildContext context) {

        if (query.length < 3) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                            "Search term must be longer than two letters.",
                        ),
                    )
                ],
            );
        }



        element = fetchPost(query);

        return Center(
            child: FutureBuilder<Element>(
                future: element,
                builder: (context, snapshot) {
//                    debugPrint(snapshot.toString());
                    if (snapshot.hasData) {

                        return ListView.builder(
                            padding: new EdgeInsets.all(8.0),
                            itemBuilder: (_, int index) {
                                Map<String, dynamic> data = snapshot.data.results[index];
                                if(data["media_type"] == "movie") {
                                    return ListTile(
                                        title: Text(data["original_title"]),
                                        subtitle: Text(data["release_date"] != "" ? data["release_date"].substring(0, 4) : ""),
                                        enabled: true,
                                        onTap: () => {
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MovieDetails(data)))
                                        }
                                    );
                                }
                                else if(data["media_type"] == "tv") {
                                    return ListTile(
                                        title: Text(data["original_name"]),
                                        subtitle: Text(data["first_air_date"] != "" ? data["first_air_date"].substring(0, 4) : ""),
                                        enabled: true,
                                        onTap: () => {
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => TvDetails(data)))
                                        }
                                    );
                                }
                                else if(data["media_type"] == "person") {
                                    return ListTile(
                                        title: Text(data["name"]),
                                        subtitle: Text("Pessoa"),
                                        enabled: true,
                                        onTap: () => {
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PersonDetails(data)))
                                        }
                                    );
                                }
                            },
                            itemCount: snapshot.data.results.length,

                        );
//                        return
                    } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                },
            ),
        );

//
    }

    @override
    Widget buildSuggestions(BuildContext context) {
        // This method is called everytime the search term changes.
        // If you want to add search suggestions as the user enters their search term, this is the place to do that.
        return Column();
    }
}