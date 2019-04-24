import 'package:flutter/material.dart';

class SearchHeaderWidget extends StatelessWidget {
    // This widget is the root of your application.

    @override
    Widget build(BuildContext context) {
        return Container(
            color: const Color(0xFFEBEBEB),
            child: Center(
                child: Text("INPUT AQUI", style: TextStyle(
                    color: Colors.black),
                )
            ),
            height: 50,
        );
    }
}
