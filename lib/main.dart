import 'package:alcool_ou_gasolina/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _txtCtrlGasolina = TextEditingController();
  var _txtCtrlAlcool = TextEditingController();

  String resText = "Insira os valores dos combustiveis";

  double calcular(double precoAlcool, double precoGasolina) {
    var res = precoAlcool / precoGasolina;

    return res;
  }

  void setResult() {
    if (_txtCtrlAlcool.text.isNotEmpty && _txtCtrlGasolina.text.isNotEmpty) {
      var precoAlcool = double.parse(_txtCtrlAlcool.text);
      var precoGasolina = double.parse(_txtCtrlGasolina.text);
      double res = calcular(precoAlcool, precoGasolina);
      if (res <= 0.7) {
        resText = "Compensa usar Alcool\n";
      } else {
        resText = "Compensa usar Gasolina";
      }
    } else {
      resText = "Insira os valores dos combustiveis";
    }

    setState(() {
      resText;
    });
  }

  void abrirGithub() async {
    const url = 'https://github.com/ramonguimaraes';
    if (await canLaunch(url)) {
      await launch(url);
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch $url")),
      );
    } else {
      throw Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch $url")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 100, 40, 0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, constraints.maxHeight / 30),
                      child: Text(
                        "Alcool\nou Gasolina",
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      child: CustomTextField(_txtCtrlGasolina, "Gasolina"),
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, constraints.maxHeight / 20),
                    ),
                    Container(
                      child: CustomTextField(_txtCtrlAlcool, "Alcool"),
                    ),
                    Container(
                      height: constraints.maxHeight / 3,
                      margin: EdgeInsets.fromLTRB(
                          0, 0, 0, constraints.maxHeight / 20),
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Center(
                        child: Text(
                          resText,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 50,
                      child: FlatButton(
                        onPressed: setResult,
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Builder(
            builder: (ctx) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  abrirGithub();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        "assets/images/github.png",
                        height: 14,
                      ),
                    ),
                    Text(
                      "ramonguimaraes",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
