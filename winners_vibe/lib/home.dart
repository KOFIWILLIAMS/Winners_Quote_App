import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:residemenu/residemenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:flutter/gestures.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:winners_vibe/tool_box.dart';

import 'details.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

///This class helps to create links, that we are using in about dialog.
class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String url, String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: new TapGestureRecognizer()
              ..onTap = () {
                urlLauncher.launch(url);
              });
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  MenuController _menuController;
  var data;

  /// to build a reside menu drawer build by library
  /*Widget buildItem(String msg, VoidCallback method) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: ResideMenuItem(
          title: msg,
          icon: const Icon(Icons.home, color: Colors.grey),
          right: const Icon(Icons.arrow_forward, color: Colors.grey),
        ),
        onTap: () => method,
      ),
    );
  }
  _sharer() {
    Share.share(" TOUGHEST - Test your knowledge.\n" +
        "The app that will make you an amazing candidate for any job.\n"
            "Are you ready?\n"
            "Download it now\n"
            "https://play.google.com/store/apps/details?id=tricky.questions");
  }*/

  _closing() {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Center(child: Text('Do You Want To Exit?')),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context, false),
                // passing false
                child: Text('No', style: TextStyle(color: Colors.brown[700])),
              ),
              CupertinoDialogAction(
                onPressed: () => SystemNavigator.pop(),
                // passing true
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.brown[700]),
                ),
              ),
            ],
          );
        });
  }

  _launchgmail() async {
    const url =
        'mailto:winnerwilliams1@gmail.com?subject=Feedback&body=Feedback for Winners Quotes';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(vsync: this);
  }

  /// about section
  _about(BuildContext context) {
    final TextStyle linkStyle = Theme.of(context)
        .textTheme
        .body2
        .copyWith(color: Colors.blueAccent, fontSize: 17.0);
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: Colors.brown[100],
            title: Text(
              "Globetech Consult LTD",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.brown[800]),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 19.0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.brown[800],
                    radius: 45,
                    child: Image(
                      height: 80.0,
                      width: 80.0,
                      image: AssetImage("assets/images/globetech.png"),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'We are into developing & publishing mobile apps no google playStore and app store,' +
                        ' for business organisation or an individuals '
                            "\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      //color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text("Contact Us On:"),
                ),
                Divider(color: Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.start,
                        text: new TextSpan(children: <TextSpan>[
                          new _LinkTextSpan(
                              style: linkStyle,
                              text: 'E-mail',
                              url:
                                  'mailto:winnerwilliams1@gmail.com?subject=Winners Quotes&body=For Business Inquiries'),
                        ])),
                    Divider(color: Colors.white),
                    RichText(
                        textAlign: TextAlign.start,
                        text: new TextSpan(children: <TextSpan>[
                          new _LinkTextSpan(
                              style: linkStyle,
                              text: 'Youtube',
                              url:
                                  'https://youtube.com/channel/UCznYgf2knzcaZJp6bshUUrw'),
                        ])),
                    Divider(),
                    RichText(
                        textAlign: TextAlign.start,
                        text: new TextSpan(children: <TextSpan>[
                          new _LinkTextSpan(
                              style: linkStyle,
                              text: 'Facebook',
                              url: 'https://web.facebook.com/GlobetechConsult'),
                        ])),
                  ],
                ),
                Divider(),
              ],
            ),
            actions: [
              OutlineButton(
                onPressed: () => Navigator.pop(context, false),
                // passing false
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.brown[700]),
                ),
              ),
            ],
          );
        });
  }

  ///Lis-t of interview questions.
  Widget getListItems(Color color, IconData icon, String title) {
    return GestureDetector(
        key: title == 'Winners Quotes' ? Key('item') : null,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.brown[900],
                    offset: Offset(0.9, 4),
                    blurRadius: 5),
              ],
              gradient: LinearGradient(
                colors: [Colors.brown[800], color],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          height: 120.0,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                    color: color,
                  ),
                ),
              ),
              Container(
                width: 3,
                color: Colors.white,
              ),
              Text(
                title,
                style: Style.headerstyle,
              )
            ],
          )),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail(
                    title: title,
                  )));
        });
  }

  ///creating a carousel using carousel pro library.
  final myCraousal = Carousel(
    dotSize: 4.0,
    dotIncreaseSize: 2.0,
    borderRadius: true,
    radius: Radius.circular(10.0),
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(seconds: 2),
    images: [
      AssetImage('assets/images/4.jpg'),
      AssetImage('assets/images/1.jpg'),
      Image.asset(
        'assets/images/10.jpg',
        fit: BoxFit.fill,
      ),
      AssetImage('assets/images/2.jpg'),
      AssetImage('assets/images/3.jpg'),
      Image.asset(
        'assets/images/9.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/5.jpg',
        fit: BoxFit.fill,
      ),
      AssetImage('assets/images/6.jpg'),
      Image.asset(
        'assets/images/8.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/7.jpg',
        fit: BoxFit.fill,
      ),
      Image.asset(
        'assets/images/11.jpg',
        fit: BoxFit.fill,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //to use reside menu library we have to return a reside menu scaffold.
    return new ResideMenu.scaffold(
      //direction: ScrollDirection.LEFT,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back.jpg"), fit: BoxFit.cover)),
      controller: _menuController,
      leftScaffold: MenuScaffold(
        header: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 120.0, maxWidth: 120.0),
          child: CircleAvatar(
            backgroundColor: Colors.brown[700],
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            radius: 45.0,
          ),
        ),
        children: <Widget>[
          ///I have to make these drawer list widgets manually cause it is containing different methods.
          Divider(
            color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              child: FittedBox(
                fit: BoxFit.fill,
                child: ResideMenuItem(
                  title: 'Suggestions',
                  titleStyle: TextStyle(
                      color: Colors.brown[700],
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      backgroundColor: Colors.white
                  ),
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(Icons.bug_report,
                          color: Colors.brown[700])),
                ),
              ),
              onTap: () => _launchgmail(),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
                child: ResideMenuItem(
                  title: 'Exit',
                  titleStyle: TextStyle(
                      color: Colors.brown[700],
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      backgroundColor: Colors.white
                  ),
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(Icons.close, color: Colors.black)),
                ),
              onTap: () => _closing(),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            elevation: 1.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              child: Icon(
                Icons.menu,
                color: Colors.brown,
              ),
              onTap: () {
                _menuController.openMenu(true);
              },
            ),
            title: Text(
              'Winners Quotes',
              style:
              Style.headerTextStyle,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.help,
                  color: Colors.brown,
                  size: 25.0,
                ),
                onPressed: () => _about(context),
              )
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                key: Key('banner'),
                padding: EdgeInsets.only(bottom: 5.0),
                height: height / 2.9,
                child: myCraousal,
              ),
              getListItems(Colors.deepOrangeAccent, Icons.local_library, 'Winners Quotes'),
              getListItems(
                  Colors.green, Icons.call_split, 'Inspirational Quotes'),
              getListItems(Colors.cyan, Icons.add_comment, 'Bible Quotes'),
              getListItems(Colors.deepPurple, Icons.accessibility, 'Success Quotes'),
              getListItems(
                  Colors.orangeAccent, Icons.assessment, 'Life Quotes'),
              getListItems(
                  Colors.black, Icons.help_outline, 'Anniversary Quotes'),
              getListItems(
                  Colors.purpleAccent, Icons.casino, 'African Proverbs'),
              getListItems(
                  Colors.green, Icons.ac_unit, 'Good Luck Quotes'),
              getListItems(
                  Colors.amber, Icons.monetization_on, 'Millionaire Quotes'),
              getListItems(
                  Colors.pinkAccent, Icons.favorite, 'Love Quotes'),
              getListItems(
                  Colors.teal, Icons.cake, 'Birthday Quotes'),
              getListItems(
                  Colors.lime, Icons.child_care, 'Funny Quotes'),
              getListItems(
                  Colors.blueAccent, Icons.fitness_center, 'Fitness Quotes'),
              //    getListItems(Colors.black, Icons.help_outline, 'Motivation Quotes'),
            ],
          ),
        ),
      ),
    );
  }
}
