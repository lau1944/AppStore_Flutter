import 'package:flutter/material.dart';
import 'package:appstore_android/screens/setting.dart';
import 'package:appstore_android/screens/app_recommend.dart';
import 'package:appstore_android/screens/game_recommend.dart';
import 'package:appstore_android/widgets/icon_badge.dart';
import 'package:appstore_android/util/const.dart';

Color grey = Color(0xFFBDBDBD);
Color blue = Color(0xFF00B0FF);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          app(),
          game(),
          setting()
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.grey[500]),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: new Image.asset('assets/app_today.png',height: 30, width: 30, color: grey),
              activeIcon: new Image.asset('assets/app_today.png',height: 30, width: 30, color: blue),
              title: new Text('Today')

            ),

            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: new Image.asset('assets/game.png',height: 30, width: 30, color: grey,),
              activeIcon: new Image.asset('assets/game.png',height: 30, width: 30, color: blue),
              title: new Text('Game Today')
            ),

            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: new Image.asset('assets/setting.png',height: 30, width: 30, color: grey),
              activeIcon: new Image.asset('assets/setting.png',height: 30, width: 30, color: blue),
              title: new Text('Setting')
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
