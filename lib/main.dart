import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

//Created Home screen class


class HomeScreen extends StatelessWidget{

  final List<String> items = [
    'one',
    'two',
    'three',
    'fourth',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
  ];

  //This is function that let us to pass trough some screen
  getItemAndNavigate(String item, BuildContext context){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(itemHolder : item,)
        )
    );
  }

  //Display First screen
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen Activity'),
      ),
        body: Center(
          child: ListView(
            children: items.map((data) => ListTile(
                title: Text(data),
                onTap: ()=>{
                  getItemAndNavigate(data, context)
                }
            ))
                .toList(),
          ),
        )
    );
  }
}

  //Created Second screen
class SecondScreen extends StatelessWidget{
  final String itemHolder;
  SecondScreen({required this.itemHolder});
  goBack(BuildContext context){
    Navigator.pop(context);
  }

  //Display second screen
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen Activity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Selected item = ' + itemHolder,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center),
          ),
          RaisedButton(
            onPressed: () {goBack(context);},
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Text('Go Back To Previous Screen'),
          ),
        ],
      )
    );
  }
}