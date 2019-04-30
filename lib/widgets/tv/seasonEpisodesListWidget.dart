import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../movieReviewWidget.dart';
import 'tvEpisodeWidget.dart';

Future<Element> fetchPost(int tvId, int season) async {
    final response = await http.get('https://api.themoviedb.org/3/tv/' + tvId.toString() + '/season/' + season.toString() + '?api_key=d7b753a5e3600c4cedca32ba02944de3');

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
            results: json['episodes'],
        );
    }
}

class SeasonEpisodesList extends StatelessWidget {
    SeasonEpisodesList(int tvId, Map<String, dynamic> data) {
        this.data = data;
        this.tvId = tvId;
        element = fetchPost(tvId, data["season_number"]);
    }

    Map<String, dynamic> data;
    int tvId;
    Future<Element> element;


    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Text(
                        "Season " + data["season_number"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                    ),
                    FutureBuilder<Element>(
                        future: element,
                        builder: (context, snapshot) {
                            debugPrint(snapshot.toString());
                            if (snapshot.hasData) {
                                return ConstrainedBox(
                                    constraints: new BoxConstraints(
                                        minHeight: 35.0,
                                        maxHeight: 170.0,
                                    ),
                                    child:  ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true, //just set this property
                                        itemBuilder: (_, int index) => TvEpisode(
                                            snapshot.data.results[index],
                                        ),
                                        itemCount: snapshot.data.results.length,

                                    ));
//                        return
                            } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                            }

                            return CircularProgressIndicator();
                        },
                    ),


                ],
            )
        );
    }
}