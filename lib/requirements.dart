
import 'package:flutter/material.dart';
import 'widgets/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequirementsPage extends StatefulWidget {
  RequirementsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RequirementsPageState createState() => new _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage> {

  void savePrefs(bool requirements) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('requirements', requirements);  
  }

  void _selected(int index) {
    if(index == 0){
            savePrefs(true);
            //change page
            Navigator.of(context).pop(true);//4

    } else {
            savePrefs(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Vérification"),
      ),
      // Body
      body: new QuestionWidget(
        // Title of the Step
        question: "Avez vous entre plus de 13 ans ?",
        // Content, it can be any widget here. Using basic Text for this example
        responses: ["Oui", "Non"],
        answered: _selected,
        ),
      backgroundColor: Colors.blue[400],
    );
  }
}
