
import 'package:flutter/material.dart';
import 'widgets/MobileStepper.dart';
import 'widgets/question.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    print("inistate");

    _prefs.then((SharedPreferences prefs) {
      if(prefs.getBool('requirements') != null && prefs.getBool('requirements') == true){
        // everythings fine
        print("requirements ok");
      } else {
          print("requirements ko");
          Navigator.of(context).pushNamed('/requirements'); 
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _clickedResponse(int index){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Home"),
      ),
      // Body
      body: const MobileStepper(
          steps: const <Widget> [
            const QuestionWidget(
              // Title of the Step
              question: "Depuis combien de temps ?",
              // Content, it can be any widget here. Using basic Text for this example
              responses: ["1 jours", "2 jours", "3 jours", "1 semaine" "Plus"],
            ),
            const QuestionWidget(
              // Title of the Step
              question: "Et ca va? ?",
              // Content, it can be any widget here. Using basic Text for this example
              responses: ["Oui", "Non"],
            ),
            const QuestionWidget(
              // Title of the Step
              question: "Tu aimes quoi comme sport ?",
              // Content, it can be any widget here. Using basic Text for this example
              responses: ["Natation", "Vélo", "Autre"],
            )
          ],
      ), backgroundColor: Colors.blue[400],
    );
  }
}
