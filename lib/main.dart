import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:imdb/constants.dart';
import 'package:imdb/screens/home_tab.dart';
import 'package:imdb/screens/search_tab.dart';
import 'package:imdb/screens/theater_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: kBgColor,
        barBackgroundColor: kBgColor,
        textTheme: CupertinoTextThemeData(
            primaryColor: kTextColor,
            textStyle: TextStyle(
              color: kTextColor,
              fontFamily: defaultFont,
            )),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: kTextColor,
          inactiveColor: kTextSecondaryColor,
          backgroundColor: kBgColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.film), label: "Theaters"),
          ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => const HomeTab());
          case 1:
            return CupertinoTabView(builder: (context) => const SearchTab());
          default:
            return CupertinoTabView(builder: (context) => const TheaterTab());
        }
      },
    );
  }
}
