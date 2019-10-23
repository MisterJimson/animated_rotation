# AnimatedRotation
An implicit animation widget for rotation
# Install
Add the dependency to your pubspec.yaml
```
dependencies:
  animated_rotation: ^0.1.0
```
Run `flutter packages get` in your root folder after saving the pubspec.yaml file
# Usage
Here is an example of the counter app with text rotating based on the count
```
import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimatedRotation example"),
        ),
        body: Center(
          child: AnimatedRotation(
            angle: _counter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```