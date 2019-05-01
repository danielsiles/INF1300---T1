import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CinfoLoader extends StatefulWidget {

    @override
    _CinfoLoaderState createState() => new _CinfoLoaderState();

}

class _CinfoLoaderState extends State<CinfoLoader> with SingleTickerProviderStateMixin {
    AnimationController animationController;


    @override
    void initState() {
        super.initState();
        animationController = new AnimationController(
            vsync: this,
            duration: new Duration(seconds: 10),
        );

        animationController.repeat();
    }

    @override
    Widget build(BuildContext context) {
        return Container (
            child: _buildBody(),
        );
    }

    Widget _buildBody() {
        return Container(
            child: Center(
                child: AnimatedBuilder(
                    animation: animationController,
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('img/cinfo_logo.png'),
                    ),
                    builder: (BuildContext context, Widget _widget) {
                        return Transform.rotate(
                            angle: animationController.value * 30.0,
                            child: _widget,
                        );
                    },
                )
            ),
        );
    }
}