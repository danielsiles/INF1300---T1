import 'package:flutter/material.dart';
import '../widgets/movieHeaderWidget.dart';
import '../widgets/movieInfoWidget.dart';
import '../widgets/movieCastWidget.dart';
import '../widgets/moviesRelatedWidget.dart';
import '../widgets/movieReviewsWidget.dart';

class MovieDetails extends StatelessWidget {
    MovieDetails(Map<String, dynamic> data) {
        this.data = data;
    }

    Map<String, dynamic> data;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(data['original_title']),
            ),
            body: ListView(
                    children: <Widget>[
                        MovieHeader(data),
                        MovieInfo(data),
                        MovieCast(data),
                        RelatedMovies(data),
                        MovieReviews(data),
                    ],
                )
        );
    }
}

