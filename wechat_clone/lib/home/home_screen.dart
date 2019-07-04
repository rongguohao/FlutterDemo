import 'package:flutter/material.dart';
import 'package:wechat_clone/constants.dart';

import '../constants.dart' show Constants;

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  List<NavigationIconView> _navigationViews;
  int _currentIndex = 0;
  List<Widget> _pages;

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
        activeIcon: IconData(0xe600, fontFamily: Constants.IconFontFamily),
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
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow)
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(children: <Widget>[
      Icon(IconData(iconName, fontFamily: Constants.IconFontFamily),
          size: 22.0, color: const Color(AppColors.AppBarPopupMenuColor)),
      Container(width: 12.0),
      Text(title,
          style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
        fixedColor: const Color(AppColors.TabIconActive),
        items: _navigationViews.map((NavigationIconView view) {
          return view.item;
        }).toList(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;

            _pageController.animateToPage(_currentIndex,
                duration: Duration(microseconds: 200), curve: Curves.easeOut);
          });
          // print('点击的是第${index + 1}个tab');
        });
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0, //阴影
        actions: <Widget>[
          IconButton(
              icon: Icon(IconData(0xe614, fontFamily: Constants.IconFontFamily),
                  size: 22.0),
              onPressed: () {
                print('点击了搜索按钮');
              }),
          Container(width: 12.0),
          // IconButton(
          //   icon:  Icon(IconData(0xe61e, fontFamily: Constants.IconFontFamily),size:22.0),
          //   onPressed: () {
          //     print('显示下拉');
          //   }),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                    child: _buildPopupMenuItem(0xe619, '发起群聊'),
                    value: ActionItems.GROUP_CHAT),
                PopupMenuItem(
                    child: _buildPopupMenuItem(0xe624, '添加朋友'),
                    value: ActionItems.ADD_FRIEND),
                PopupMenuItem(
                    child: _buildPopupMenuItem(0xe634, '扫一扫'),
                    value: ActionItems.QR_SCAN),
                PopupMenuItem(
                    child: _buildPopupMenuItem(0xe656, '收付款'),
                    value: ActionItems.PAYMENT)
              ];
            },
            icon: Icon(IconData(0xe61e, fontFamily: Constants.IconFontFamily),
                size: 22.0),
            onSelected: (ActionItems selected) {
              print('点击的是$selected');
            },
          ),
          Container(width: 16.0)
        ],
        // backgroundColor: Color(0xff303030),
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState((){
            _currentIndex=index;
          });
          print('当前显示的是第$index页');
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
