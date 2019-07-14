import 'package:flutter/material.dart';

import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, mockConversations;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.ConvertsationItemBgColor),
          border: Border(
              bottom: BorderSide(
                  width: Constants.DividerWidth,
                  color: Color(AppColors.DividerColor)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/default_nor_avatar.png',
            width: Constants.ConversationAvatorSize,
            height: Constants.ConversationAvatorSize,
          ),
          Container(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(conversation.title, style: AppStyles.TitleStyle),
              Text(conversation.des, style: AppStyles.DesStyle)
            ],
          )),
          Column(
            children: <Widget>[Text(conversation.updateAt, style: AppStyles.DesStyle)],
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _ConversationItem(conversation:mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
