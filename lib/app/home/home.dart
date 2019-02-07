import 'package:flutter/material.dart';
import 'package:tp3/app/learning/learning.dart';
import 'package:tp3/app/training/training.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      body: Center(
          child: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[Learning(), Training()],
      )),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.book), title: Text(strings.learn)),
            BottomNavigationBarItem(
                icon: Icon(Icons.create), title: Text(strings.train))
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.red,
          onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
