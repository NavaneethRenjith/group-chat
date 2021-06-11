import 'package:flutter/material.dart';
import 'dart:math';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String userImage;
  final bool isMe;
  final Key? key;

  MessageBubble(this.message, this.username, this.userImage, this.isMe,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe)
          CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[800] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // isMe ? 'You' : username, //! try this
                username,
                style: TextStyle(
                  // color: Theme.of(context).accentTextTheme.headline6!.color,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                message,
                style: TextStyle(
                    color: Theme.of(context).accentTextTheme.headline6!.color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
