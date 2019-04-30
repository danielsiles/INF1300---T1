import 'package:flutter/material.dart';
import '../../views/movieDetails.dart';
import '../../views/tvDetails.dart';
import '../../views/personDetails.dart';

class CategoryImage extends StatelessWidget {
    CategoryImage(Map<String, dynamic> data, String imgPath, String name, String type) {
        this.data = data;
        this.imgPath = imgPath;
        this.type = type;
        this.name = name;
    }

    Map<String, dynamic> data;
    String imgPath;
    String type;
    String name;

    @override
    Widget build(BuildContext context) {

        String imgUrl = "https://i.stack.imgur.com/34AD2.jpg";
        if(this.imgPath != null) {
            imgUrl = "http://image.tmdb.org/t/p/w500" + imgPath;
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
                        else if(type == "person") {
                            return PersonDetails(data);
                        }
                    }));
            },
            child: Container(
                width: 180.0,
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                        Container(
                            width: 180.0,
                            height: 180.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        imgUrl)
                                )
                            )),
                        Text(this.name,
                            textScaleFactor: 1.0)
                    ],
                )
            ),
        );
    }
}