import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show Clipboard, ClipboardData, SystemNavigator, rootBundle;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';

import 'package:share/share.dart';

import 'package:winners_vibe/show_details.dart';
import 'package:winners_vibe/tool_box.dart';

class Detail extends StatefulWidget {
  var data;
  var title;
  String quest;

  Detail({this.data, this.quest, this.title});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List list() {
    String type;
    if (widget.title == 'Winners Quotes') {
      type = "Winners";
    } else if (widget.title == 'Inspirational Quotes') {
      type = "Inspirational";
    } else if (widget.title == 'Bible Quotes') {
      type = "Bible";
    } else if (widget.title == 'Success Quotes') {
      type = "Success";
    } else if (widget.title == "Life Quotes") {
      type = "Life";
    } else if (widget.title == "Anniversary Quotes") {
      type = "Anniversary";
    } else if (widget.title == "African Proverbs") {
      type = "African_Proverbs";
    } else if (widget.title == "Good Luck Quotes") {
      type = "Good_Luck";
    } else if (widget.title == "Millionaire Quotes") {
      type = "Millionaire";
    } else if (widget.title == "Love Quotes") {
      type = "Love";
    } else if (widget.title == "Birthday Quotes") {
      type = "Birthday";
    } else if (widget.title == "Funny Quotes") {
      type = "Funny";
    } else if (widget.title == "Fitness Quotes") {
      type = "Fitness";
    }

    var list;
    list = widget.data[type] as List;
    print(list);
    List<Item> typeList = list.map((i) => Item.fromJson(i)).toList();
    return typeList;
  }

  share(String title) {
    Share.share("Winners Quotes App\n\n" +
        title +
        "\n\nGet it on Google PlayStore for free (About 2000 Quotes)");
  }

  ///Takes the local json file which is not included in this repository,
  ///because that contains, Q/A data.
  _retrieveLocalData() async {
    return await rootBundle.loadString('assets/local.json');
  }

  ///take the asset and decode json file.
  loadData() async {
    try {
      String type;
      ItemList itemList;
      if (widget.title == 'Winners Quotes') {
        type = "Winners";
      } else if (widget.title == 'Inspirational Quotes') {
        type = "Inspirational";
      } else if (widget.title == 'Bible Quotes') {
        type = "Bible";
      } else if (widget.title == 'Success Quotes') {
        type = "Success";
      } else if (widget.title == "Life Quotes") {
        type = "Life";
      } else if (widget.title == "Anniversary Quotes") {
        type = "Anniversary";
      } else if (widget.title == "African Proverbs") {
        type = "African_Proverbs";
      } else if (widget.title == "Good Luck Quotes") {
        type = "Good_Luck";
      } else if (widget.title == "Millionaire Quotes") {
        type = "Millionaire";
      } else if (widget.title == "Love Quotes") {
        type = "Love";
      } else if (widget.title == "Birthday Quotes") {
        type = "Birthday";
      } else if (widget.title == "Funny Quotes") {
        type = "Funny";
      } else if (widget.title == "Fitness Quotes") {
        type = "Fitness";
      }

      String jsonString = await _retrieveLocalData();
      final jsonResponse = json.decode(jsonString);
      final jsonData = jsonResponse[type];
      itemList = ItemList.fromJson(jsonData);
      return itemList.list;
    } catch (e) {
      print(e);
    }
  }

  ///favorite with shared prefrence
  List<String> savedQ = List<String>();
  String quest;

  //String data;

  //String title;

  ///List of questions uses futurBuilder.
  Widget buildListItems() {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: new CircularProgressIndicator(backgroundColor: Colors.white,));
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int i) {
            ///favorite
            /* bool isSaved = savedQ.contains(word);
            String word = snapshot.data[i].question;
            _update() async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              savedQ = prefs.getStringList("Q");
              setState(() {
                if (isSaved) {
                  savedQ.remove(word);
                } else {
                  savedQ.add(word);
                }
              });
            }*/
            String quest;
            quest = snapshot.data[i].question;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Color(0xFFC67A7D),
                          child: Text(
                            "$i",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      title: Text(
                        quest,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Style.commonTextStyle,
                      ),
                      trailing: GestureDetector(
                        onTap: () => share(quest),
                        child: Icon(Icons.share),
                      ),

                      ///favorite
                      /*GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSaved) {
                            savedQ.remove(word);
                          } else {
                            savedQ.add(word);
                          }
                        });
                      },
                      child: Icon(
                        isSaved ? Icons.favorite : Icons.favorite_border,
                        color: isSaved ? Colors.red : null,
                      ),
                    ),*/

                      onTap: () => _showMoreDetails(context, quest)

                      //_showDetail(quest)
                      /*  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowDetail(
                          quest: quest,
                          title: widget.title,
                          //data: data,
                          //ans: ans
                        ),
                      ),
                    ),*/
                      ),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(
                        color: Colors.white,
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          /*actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () => favoriteQuote(context),
            ),
          ],*/
          elevation: 3.0,
          backgroundColor: new Color(0xFFC67A7D),
          title: Text(widget.title)),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            child: Container(
              child: buildListItems(),
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
      ),
    );
  }

  /// about section
  _showMoreDetails(BuildContext context, String quest) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 3,
            backgroundColor: Colors.brown[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.brown[700],
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                    ),
                    radius: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.brown[700]),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context, false),
                      child: Icon(
                        CupertinoIcons.clear_thick_circled,
                        size: 45,
                        color: Colors.white,
                      ),
                      // label: Text("close")
                    ),
                  ),
                ],
              ),
            ),
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.brown[900],
                        offset: Offset(0.9, 4),
                        blurRadius: 6),
                  ],
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFC67A7D),
                      Color(0xFF5D3068),
                      //Colors.brown[700],
                    ],
                    stops: [0.0, 0.9],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),

              height: MediaQuery.of(context).size.height / 2.5,
              child: Center(
                child: ListView(
                  padding: EdgeInsets.all(5),
                  shrinkWrap: true,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child:  Text(
                          quest,
                          textAlign: TextAlign.center,
                          style: Style.commonTextStyle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            actions: [
              ///Dialog package r flutter_alert
              DialogButton(
                width: 100,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Share",
                      style: Style.regularTextStyle,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      //size: 30,
                    )
                  ],
                ),
                onPressed: () => share(quest),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF5D3068),
                    Color(0xFFC67A7D),

                    //Colors.brown[700],
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: DialogButton(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Copy",
                        style: Style.regularTextStyle,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Icon(
                        Icons.content_copy,
                        color: Colors.white,
                        //size: 30,
                      )
                    ],
                  ),
                  onPressed: () {
                    Clipboard.setData(new ClipboardData(
                        text: "Winners Quotes App\n\n" +
                            quest +
                            "\n\nGet it on Google PlayStore for free (About 2000 Quotes)"));
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Row(
                        children: <Widget>[
                          Icon(Icons.content_copy),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Copied",
                            style: Style.regularTextStyle,
                          )
                        ],
                      ),
                      duration: Duration(seconds: 200),
                      backgroundColor: Color(0xFFC67A7D),
                    ));
                    //_scaffoldKey.currentState.hideCurrentSnackBar();
                  },
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFC67A7D),
                      Color(0xFF5D3068),
                      //Colors.brown[700],
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

}


///these two classes are here to help in decoding json data.
class ItemList {
  List<Item> list;

  ItemList({this.list});

  factory ItemList.fromJson(List<dynamic> parsedJson) {
    var lists = parsedJson;
    List<Item> itemLists = lists.map((f) => Item.fromJson(f)).toList();
    return ItemList(list: itemLists);
  }
}

class Item {
  String question;

  Item({this.question});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(question: parsedJson['Q']);
  }
}
