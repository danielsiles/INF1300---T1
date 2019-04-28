import 'package:flutter/material.dart';
import 'movieRelatedWidget.dart';

class CombinedRelated extends StatelessWidget {
    CombinedRelated(List<dynamic> data) {
        this.data = data;
    }

    List<dynamic> data;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    Text(
                        "Related movies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                    ),
                    ConstrainedBox(
                        constraints: new BoxConstraints(
                            minHeight: 35.0,
                            maxHeight: 210.0,
                        ),
                        child:  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true, //just set this property
                            itemBuilder: (_, int index) => MovieRelated(
                                data[index],
                            ),
                            itemCount: data.length,

                        )
                    )

                ],
            ),
        );
    }
}