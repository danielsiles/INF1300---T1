import 'package:flutter/material.dart';
import '../widgets/coverImageWidget.dart';
import '../widgets/posterWidget.dart';

class MovieHeader extends StatelessWidget {
    MovieHeader(Map<String, dynamic> data, String title) {
        this.data = data;
        this.title = title;
    }

    Map<String, dynamic> data;
    String title;

    @override
    Widget build(BuildContext context) {
        debugPrint("TESTE1");
        return Stack(
            children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 140.0),
                    child: CoverImage("http://image.tmdb.org/t/p/w500/" + data["backdrop_path"]),
                ),
                Positioned(
                    bottom: 0.0,
                    left: 16.0,
                    right: 16.0,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            Poster(
                                "http://image.tmdb.org/t/p/w185/" + data["poster_path"],
                                height: 180.0,
                            ),
                            SizedBox(width: 16.0),

                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        SizedBox(height: 60.0),
                                        Text(
                                            this.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),
                                        ),
                                        SizedBox(height: 8.0),
                                        SizedBox(height: 12.0),
                                    ],
                                ),
                            )
                        ],
                    ),
                ),

            ],
        );
    }
}