import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvVideos extends StatelessWidget {
    TvVideos(List<dynamic> data) {
        this.data = data;
    }

    List<dynamic> data;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Text(
                        "Videos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                    ),
                    ConstrainedBox(
                        constraints: new BoxConstraints(
                            minHeight: 35.0,
                            maxHeight: 120.0,
                        ),
                        child:  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true, //just set this property
                            itemBuilder: (_, int index) => Container(
                                height: 200,
                                width: 200,
                                padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
                                child: YoutubePlayer(
                                    context: context,
                                    videoId: data[index]["key"],
                                    autoPlay: false,
                                    showVideoProgressIndicator: true,
                                )
                            ),
                            itemCount: data.length,

                        )
                    )
                ],
            )
        );
    }
}