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
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(conversation.avatar,
          height: Constants.ConversationAvatorSize,
          width: Constants.ConversationAvatorSize);
    } else {
      avatar = Image.asset(conversation.avatar,
          height: Constants.ConversationAvatorSize,
          width: Constants.ConversationAvatorSize);
    }
    Widget avatarContainer;
    if (conversation.unReadMsgCount > 0) {
      // 未读消息
      Widget unreadMsgCountText = Container(
          width: Constants.UnReadMsgNotifyDotSize,
          height: Constants.UnReadMsgNotifyDotSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
              color: Color(AppColors.NotifyDotBg)),
          child: Text(conversation.unReadMsgCount.toString(),
              style: AppStyles.UnreadMsgCountDotStyle));

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(right: -6.0, top: -6.0, child: unreadMsgCountText)
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    //勿扰模式图标

    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      SizedBox(height: 10.0)
    ];

    if (conversation.isMute) {
      _rightArea.add(Icon(
          IconData(0xe614, fontFamily: Constants.IconFontFamily),
          color: Color(AppColors.ConversationMuteIcon),
          size: Constants.ConversationMuteIconSize));
    } else {
      _rightArea.add(Icon(
          IconData(0xe614, fontFamily: Constants.IconFontFamily),
          color: Colors.transparent,
          size: Constants.ConversationMuteIconSize));
    }

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
          avatarContainer,
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
            children: _rightArea,
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
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
