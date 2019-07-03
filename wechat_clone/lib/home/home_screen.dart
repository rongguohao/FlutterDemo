import 'package:flutter/material.dart';
import 'package:wechat_clone/constants.dart';

import '../constants.dart' show Constants;

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

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
  int _currentIndex = 0;

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
        items: _navigationViews.map((NavigationIconView view) {
          return view.item;
        }).toList(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // print('点击的是第${index + 1}个tab');
        });
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,//阴影
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
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
