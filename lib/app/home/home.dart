import 'package:flutter/material.dart';
import 'package:tp3/app/learning/learning.dart';
import 'package:tp3/app/tryout/tryout.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  final _widgets = [Learning(), Tryout()];

  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      body: Center(child: _widgets.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("Learning")),
        BottomNavigationBarItem(icon: Icon(Icons.create), title: Text("Tryout"))
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
