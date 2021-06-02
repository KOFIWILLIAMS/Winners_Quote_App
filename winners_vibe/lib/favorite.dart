/*

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:winners_vibe/tool_box.dart';

class FavoriteQuotePage extends StatelessWidget {
  final List<String> favoriteItems;

  const FavoriteQuotePage({Key key, @required this.favoriteItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites words'),
        ),
        body: Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        )
      */
/*Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            child: Container(
              child: ListView.separated(
                itemCount: favoriteItems.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(favoriteItems[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Style.commonTextStyle,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFC67A7D),
                  Color(0xFF5D3068),
                ],
                stops: [0.0, 0.9],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              )),
            ),
          ),
        ],
      ),*//*

    );
  }


}*/

