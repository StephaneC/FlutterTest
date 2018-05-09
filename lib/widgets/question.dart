import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  
  final String question;
  final List<String> responses;
  final int index = 0;
  final ValueChanged<int> answered;

  
  const QuestionWidget({this.question, this.responses, this.answered});

 
  List<Widget> createButtons(){
    List<Widget> list = new List();
    for(int i = 0; i<responses.length; i++){
      list.add(new Container(        
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(25.0),
          border: new Border.all(
            color: Colors.white,
            width: 1.0,
          ),
      ),
      margin: new EdgeInsets.symmetric(vertical: 20.0),
      width: 200.0,
      child: new FlatButton(
          child: new Text(responses[i],
            style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
            ),
          onPressed: (){
            this.answered(i);
          }
        )
      ));      
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          margin: new EdgeInsets.symmetric(vertical: 20.0),
          child: new Center(
            child: new Text(this.question, 
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                      
                ),
          )
        ),
        new Column(
          children: createButtons()
        ),
      ],
    );
  }
}
