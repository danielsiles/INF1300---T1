import 'package:flutter/material.dart';
import '../widgets/movieHeaderWidget.dart';
import '../widgets/movieInfoWidget.dart';
import 'package:http/http.dart' as http;
import '../widgets/tv/seasonEpisodesListWidget.dart';
import 'dart:async';
import 'dart:convert';
import '../widgets/tv/tvCastWidget.dart';
import '../widgets/tv/tvVideos.dart';
import '../widgets/tv/tvRelated.dart';


Future<Element> fetchPost(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/tv/' + query.toString() + '?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US&append_to_response=videos%2Cimages');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return Element.fromJson(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

Future<Element> fetchPostCast(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/tv/' + query.toString() + '/credits?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US&append_to_response=videos%2Cimages');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return Element.fromJsonCast(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

Future<Element> fetchPostRelated(int query) async {
    final response = await http.get('https://api.themoviedb.org/3/tv/' + query.toString() + '/similar?api_key=d7b753a5e3600c4cedca32ba02944de3&language=en-US');

    if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return Element.fromJsonRelated(json.decode(response.body));
    } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
    }
}

class Element {
    final Map<String, dynamic> results;
    final List<dynamic> cast;
    final List<dynamic> related;

    Element({this.results, this.cast, this.related});

    factory Element.fromJson(Map<String, dynamic> json) {
        return Element(
            results: json,
        );
    }

    factory Element.fromJsonCast(Map<String, dynamic> json) {
        return Element(
            cast: json["cast"],
        );
    }

    factory Element.fromJsonRelated(Map<String, dynamic> json) {
        return Element(
            related: json["results"],
        );
    }

}

class TvDetails extends StatelessWidget {
    TvDetails(Map<String, dynamic> data) {
        this.data = data;
        element = fetchPost(data["id"]);
        elementCast = fetchPostCast(data["id"]);
        elementRelated = fetchPostRelated(data["id"]);
    }

    Map<String, dynamic> data;
    Future<Element> element;
    Future<Element> elementCast;
    Future<Element> elementRelated;

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
                                MovieHeader(snapshot.data.results, snapshot.data.results["name"]),
                                MovieInfo(data),
                                Column(
                                    children: snapshot.data.results["seasons"].map<Widget>((element) {
                                        return SeasonEpisodesList(
                                            snapshot.data.results["id"],
                                            element);
                                    }).toList()
                                ),
                                TvVideos(snapshot.data.results['videos']["results"]),
                                TvCast("Creators", snapshot.data.results['created_by']),
                                FutureBuilder<Element>(
                                    future: elementCast,
                                    builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                            return Column(
                                                children: <Widget>[
                                                    TvCast("Cast", snapshot.data.cast),
                                                ],
                                            );
                                        } else if (snapshot.hasError) {
                                            return Text("${snapshot.error}");
                                        }

                                        return CircularProgressIndicator();
                                    },
                                ),
                                FutureBuilder<Element>(
                                    future: elementRelated,
                                    builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                            return Column(
                                                children: <Widget>[
                                                    RelatedMedias(snapshot.data.related),
                                                ],
                                            );
                                        } else if (snapshot.hasError) {
                                            return Text("${snapshot.error}");
                                        }

                                        return CircularProgressIndicator();
                                    },
                                )
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

