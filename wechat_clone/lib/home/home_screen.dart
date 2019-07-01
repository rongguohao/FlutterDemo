import 'package:flutter/material.dart';
import 'package:wechat_clone/constants.dart';

import '../constants.dart' show Constants;

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: Icon(icon, color: Color(AppColors.TabIconNormal)),
            activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive)),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 14.0, color: Color(AppColors.TabIconNormal)),
            ),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(0xe743, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe619, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(0xe601, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe601, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(0xe66c, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe68f, fontFamily: Constants.IconFontFamily),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(0xe617, fontFamily: Constants.IconFontFamily),
        activeIcon: IconData(0xe606, fontFamily: Constants.IconFontFamily),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
        items: _navigationViews.map((NavigationIconView view) {
          return view.item;
        }).toList(),
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print('点击的是第${index + 1}个tab');
        });
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('点击了搜索按钮');
              }),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('显示下拉');
            },
          )
        ],
        // backgroundColor: Color(0xff303030),
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
