import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
    CategoryWidget(String text) {
        this.text = text;
    }
    // This widget is the root of your application.
    String text;
    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.all(10.0),
            color: const Color(0xFF00FF00),
            child: Center(
                child: Text(this.text, style: TextStyle(
                    color: Colors.black),
                )
            ),
            height: 80,
        );
    }
}

