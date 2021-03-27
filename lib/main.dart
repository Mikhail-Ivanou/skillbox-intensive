import 'package:flutter/material.dart';
import 'package:flutter_2_app/colors.dart';
import 'package:flutter_2_app/ui/episodes/episodes_list.dart';
import 'package:flutter_2_app/ui/locations/locations_list.dart';
import 'package:flutter_2_app/ui/persons/persons_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: _position, keepPage: true);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        backgroundColor: AppColors.mainBackground,
        scaffoldBackgroundColor: AppColors.mainBackground,
      ),
      home: Scaffold(
        //TODO tabs
        body: PageView(
          onPageChanged: (page) => setState(() {
            _position = page;
          }),
          controller: controller,
          children: [
            PersonsList(),
            LocationsList(),
            EpisodesList(),
          ],
        ),
        appBar: AppBar(
          title: Center(child: Text('Rick and Morty')),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _position,
          onTap: (page) => setState(() {
            controller.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.decelerate);
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_sharp), label: 'Characters'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Locations'),
            BottomNavigationBarItem(icon: Icon(Icons.local_movies), label: 'Episodes'),
          ],
        ),
      ),
    );
  }
}
