import 'package:flutter/material.dart';
import "customSearchDelegate.dart";
class Categories extends StatefulWidget {
    Categories({ Key key }) : super(key: key);
    @override
    _SearchListState createState() => new _SearchListState();

}

class _SearchListState extends State<Categories>
{
    Widget appBarTitle = new Text("Search Sample", style: new TextStyle(color: Colors.white),);
    Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
    final key = new GlobalKey<ScaffoldState>();
    final TextEditingController _searchQuery = new TextEditingController();
    bool isSearching;
    FocusNode _focus = new FocusNode();

    @override
    void initState() {
        super.initState();
        _focus.addListener(_onFocusChange);
    }

    void _onFocusChange(){
        if(_focus.hasFocus) {
            FocusScope.of(context).requestFocus(new FocusNode());
            showSearch(
                context: context,
                delegate: CustomSearchDelegate()
            );
        }

        debugPrint(_focus.hasFocus.toString());
    }

    @override
    Widget build(BuildContext context) {
        return new DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: this.buildBar(context),
                body: TabBarView(
                    children: [
                        Text("Filmes"),
                        Text("Séries"),
                        Text("Pessoas"),
                    ],
                ),
            ),
        );
    }

    Widget buildBar(BuildContext context) {
        return new AppBar(
            bottom: TabBar(
                tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                ],
            ),
            centerTitle: true,
            title: new TextField(
                controller: _searchQuery,
                style: new TextStyle(
                    color: Colors.white,

                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)
                ),
                focusNode: _focus,
            ),

        );
    }

    void _handleSearchStart() {
        setState(() {
            isSearching = true;
        });
    }

    void _handleSearchEnd() {
        setState(() {
            this.actionIcon = new Icon(Icons.search, color: Colors.white,);
            this.appBarTitle =
            new Text("Search Sample", style: new TextStyle(color: Colors.white),);
            isSearching = false;
            _searchQuery.clear();
        });
    }

}

class ChildItem extends StatelessWidget {
    final String name;
    ChildItem(this.name);
    @override
    Widget build(BuildContext context) {
        return new ListTile(title: new Text(this.name));
    }

}
