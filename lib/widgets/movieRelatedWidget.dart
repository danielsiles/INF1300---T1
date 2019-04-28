import 'package:flutter/material.dart';
import '../views/movieDetails.dart';

class MovieRelated extends StatelessWidget {
    MovieRelated(Map<String, dynamic> data) {
        this.data = data;
    }

    Map<String, dynamic> data;

    @override
    Widget build(BuildContext context) {

        String imgUrl = "https://i.stack.imgur.com/34AD2.jpg";
        if(this.data["poster_path"] != null) {
            imgUrl = "http://image.tmdb.org/t/p/w500" + this.data["poster_path"];
        }

        return GestureDetector(
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieDetails(data)));
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
                        Text(this.data["original_title"],
                            textScaleFactor: 1.0)
                    ],
                )
            ),
        );
    }
}