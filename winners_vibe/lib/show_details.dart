/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mark922_flutter_lottie/mark922_flutter_lottie.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:winners_vibe/details.dart';
import 'dart:math';

import 'tool_box.dart';

class ShowDetail extends StatefulWidget {
  String quest;
  final String title;
  String data;

  static var randomNumber = Random();

  ShowDetail({this.quest, this.title, this.data});

  static final List<Color> _colors = [
    Colors.red,
    Colors.teal,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.amber,
    Colors.black,
    Colors.deepPurple,
    Colors.blueGrey,
  ];

  @override
  ShowDetailState createState() {
    return ShowDetailState();
  }
}

class ShowDetailState extends State<ShowDetail> {
  LottieController controller2;
  StreamController<double> newProgressStream;

  @override
  void initState() {
    super.initState();
    newProgressStream = StreamController<double>();
  }

  @override
  void dispose() {
    newProgressStream.close();
    super.dispose();
  }

  share(
    String question,
    //String answer
  ) {
    Share.share(question +
        "\n\n" +
        //answer +
        "\n\nDownload the app for more amazing Q/A\n " +
        "https://play.google.com/store/apps/details?id=tricky.questions");
  }

  ///add details in card.
  Widget cardDetail(String text) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
              borderRadius: BorderRadius.circular(9.0),
              color: ShowDetail._colors[ShowDetail.randomNumber.nextInt(100) %
                  ShowDetail._colors.length],
            ),
            margin: EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Style.commonTextStyle,
            )),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: Color(0xFFC67A5D),
          title: Text(widget.title),
        ),
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardDetail(widget.quest),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            shape: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                borderSide: BorderSide.none),
                            splashColor: const Color(0xff382151),
                            elevation: 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Share",
                                  style: Style.regularTextStyle,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.share),
                              ],
                            ),
                            color: Color(0xFF56cfdf),
                            onPressed: () => share(
                              widget.quest,
                              //  widget.ans
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          child: RaisedButton(
                              shape: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none),
                              splashColor: const Color(0xff382151),
                              elevation: 5.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Copy",
                                    style: Style.regularTextStyle,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.content_copy),
                                ],
                              ),
                              color: Color(0xFF56cfdf),
                              onPressed: () {
                                Clipboard.setData(
                                    new ClipboardData(text: widget.quest));
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Row(
                                    children: <Widget>[
                                      Icon(Icons.content_copy),
                                      Divider(
                                        thickness: 3,
                                      ),
                                      Text(
                                        "Copied",
                                        style: Style.regularTextStyle,
                                      )
                                    ],
                                  ),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFFC67A7D),
                                ));
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: dialVisible,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.arrow_forward),
                backgroundColor: Colors.red,
                label: 'next',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => _nextItem()
                //print('FIRST CHILD')
                ),
            SpeedDialChild(
                child: Icon(Icons.arrow_back),
                backgroundColor: Colors.blue,
                label: 'previous',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => _preItems()
                // print('SECOND CHILD'),
                ),
          ],
        ),
      ),
    );
  }

*/
/*  var tempData = [];
  for ( var index=0; index<data.length; index++ ) {
  if ( data[index].Status == "Valid" ) {
  tempData.push( data );
  }
  }
  data = tempData;*//*


  ///move to next item
  void _nextItem() {
    setState(() {
      int currentIndex = widget.quest.indexOf(widget.data);
      var nextQuote = widget.quest[currentIndex++];
      widget.quest = nextQuote;
    });
  }

  void _preItems() {
    setState(() {
      for (var currentIndex = 0;
          currentIndex < widget.data.length;
          currentIndex++) {
        currentIndex = widget.quest.indexOf(widget.data);
      }
    });
  }

  /// for floating action buttom
  bool dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  void onViewCreatedFile(LottieController controller) {
    this.controller2 = controller;
    newProgressStream.stream.listen((double progress) {
      this.controller2.setAnimationProgress(progress);
    });
  }
}
*/
