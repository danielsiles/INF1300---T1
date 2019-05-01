import 'package:flutter/material.dart';
import '../views/movieDetails.dart';
import '../views/tvDetails.dart';

class MovieRelated extends StatelessWidget {
    MovieRelated(Map<String, dynamic> data, String type) {
        this.data = data;
        this.type = type;
    }

    Map<String, dynamic> data;
    String type;

    @override
    Widget build(BuildContext context) {
        String name = "";
        String imgUrl = "https://i.stack.imgur.com/34AD2.jpg";
        if(this.data["poster_path"] != null) {
            imgUrl = "http://image.tmdb.org/t/p/w500" + this.data["poster_path"];
        }
        if(type == "movie") {
            name = data["title"];
        }
        else if(type == "tv") {
            name = data["name"];
        }

        return GestureDetector(
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                        if(type == "movie") {
                            return MovieDetails(data);
                        }
                        else if(type == "tv") {
                            return TvDetails(data);
                        }
                    }));
            },
            child: Container(
                width: 120.0,
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                        Container(
                            width: 120.0,
                            height: 150.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        imgUrl)
                                )
                            )),
                        Text(name,
                            textScaleFactor: 1.0)
                    ],
                )
            ),
        );
    }
}