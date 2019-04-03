import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter I18n',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
      localizationsDelegates: [
        FlutterI18nDelegate(
            useCountryCode: false, fallbackFile: 'fr', path: 'assets/i18n'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  Locale currentLang;
  int clicked = 0;

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () async {
      await FlutterI18n.refresh(context, new Locale('fr'));
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }

  changeLanguage() {
    setState(() {
      currentLang = currentLang.languageCode == 'fr'
          ? new Locale('en')
          : new Locale('es');
    });
  }

  language(String lang) {
    setState(() {
      new Future.delayed(Duration.zero, () async {
        await FlutterI18n.refresh(context, new Locale(lang));
        setState(() {
          currentLang = FlutterI18n.currentLocale(context);
        });
      });
    });
  }

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text(FlutterI18n.translate(context, "title"))),
      body: new Builder(builder: (BuildContext context) {
        return new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Wrap(
                        spacing: 8.0,
                        runAlignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          new RaisedButton.icon( elevation: 4.0,
                            icon: Image.network('http://flags.fmcdn.net/data/flags/w580/fr.png' ,width: 45,height: 30,) ,
                              color: Colors.grey,
                            onPressed: () async {
                              language("fr");
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                    FlutterI18n.translate(context, "toastMessage")),
                              ));
                            },
                            label: Text("",style: TextStyle(
                                color: Colors.white, fontSize: 3.0))
                          ),
                          new RaisedButton.icon( elevation: 4.0,
                            icon: Image.network('https://cdn.webshopapp.com/shops/94414/files/54955694/image-drapeau-anglais-telechargement-gratuit.jpg' ,width: 45,height: 30,) ,
                              color: Colors.grey,
                            onPressed: () async {
                              language("en");
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                    FlutterI18n.translate(context, "toastMessage")),
                              ));
                            },
                            label: Text("",style: TextStyle(
                                color: Colors.white, fontSize: 3.0))
                          ),
                          new RaisedButton.icon( elevation: 4.0,
                            icon: Image.network('https://cdn.pixabay.com/photo/2012/04/11/15/33/spain-28530_960_720.png' ,width: 45,height: 30,) ,
                              color: Colors.grey,
                            onPressed: () async {
                              language("es");
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                    FlutterI18n.translate(context, "toastMessage")),
                              ));
                            },
                            label: Text("",style: TextStyle(
                                color: Colors.white, fontSize: 3.0))
                          ),
                          new RaisedButton.icon( elevation: 4.0,
                            icon: Image.network('http://flags.fmcdn.net/data/flags/w580/it.png' ,width: 45,height: 30,) ,
                              color: Colors.grey,
                            onPressed: () async {
                              language("it");
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                    FlutterI18n.translate(context, "toastMessage")),
                              ));
                            },
                            label: Text("",style: TextStyle(
                                color: Colors.white, fontSize: 3.0))
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              new Text(FlutterI18n.translate(context, "label.main",
                  Map.fromIterables(["user"], ["Flutter lover"]))),
              new Text(FlutterI18n.plural(context, "clicked.times", clicked)),
              new FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    incrementCounter();
                  },
                  child: new Text(FlutterI18n.translate(context, "button.clickMe"))
              ),
              
            ],
          ),
        );
      }),
    );
  }
}