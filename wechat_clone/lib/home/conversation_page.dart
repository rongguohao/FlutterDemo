import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;

class _ConversationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.ConvertsationItemBgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/default_nor_avatar.png'),
          Expanded(
              child: Container(
            color: Colors.blue,
            width: 100.0,
          )),
          Container(
            color: Colors.yellow,
            width: 100.0,
          )
        ],
      ),
    );
  }
}

class ConvertsationPage extends StatefulWidget {
  @override
  _ConvertsationPageState createState() => _ConvertsationPageState();
}

class _ConvertsationPageState extends State<ConvertsationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: _ConversationItem(),
    );
  }
}
