import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/models/user.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.user.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_horiz),
                iconSize: 30,
                onPressed: () {},
                color: Colors.white)
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.only(top: 15),
                          itemCount: chats.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            final message = chats[idx];
                            bool isMe = message.sender.id == currentUser.id;
                            return _buildMessage(message, isMe);
                          }),
                    )),
              ),
              _buildMessageComposer()
            ],
          ),
        ));
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.photo),
              iconSize: 25,
              color: Theme.of(context).primaryColor),
          Expanded(
              child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send message"))),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
              iconSize: 25,
              color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
        width: MediaQuery.of(context).size.width * .75,
        margin: isMe
            ? EdgeInsets.only(top: 8.0, bottom: 8, left: 80)
            : EdgeInsets.only(
                top: 8.0,
                bottom: 8,
              ),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.time,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(message.text,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ],
        ));
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
            onPressed: () {},
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            iconSize: 30,
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.blueGrey)
      ],
    );
  }
}
