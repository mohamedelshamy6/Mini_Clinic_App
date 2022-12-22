import 'package:flutter/material.dart';
import 'package:mini_hospital/style/costraints.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.isMe,
      required this.type,
      required this.message,
      required this.key});

  final Key key;
  final String message;
  final String type;

  //final String userName;

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              !isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            type == 'text'
                ? Container(
                    decoration: BoxDecoration(
                      color: !isMe
                          ? Colors.grey[300]
                          : Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                        bottomLeft:
                            isMe ? Radius.circular(0) : Radius.circular(14),
                        bottomRight:
                            !isMe ? Radius.circular(0) : Radius.circular(14),
                      ),
                    ),
                    width: 140,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: !isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   userName,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     color: !isMe
                        //         ? Colors.black
                        //         : Theme.of(context).accentTextTheme.headline6!.color,
                        //   ),
                        // ),
                        Text(
                          message,
                          style: TextStyle(
                              color: !isMe
                                  ? Colors.black
                                  : Theme.of(context)
                                      .accentTextTheme
                                      .headline6!
                                      .color),
                          textAlign: !isMe ? TextAlign.end : TextAlign.start,
                        )
                      ],
                    ),
                  )
                : Container(
                    height: MediaQueryHelper.sizeFromHeight(context, 5),
                    width: MediaQueryHelper.sizeFromHeight(context, 2),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    alignment: !isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ShowImage(
                            imageUrl: message,
                          ),
                        ),
                      ),
                      child: Container(
                        height: MediaQueryHelper.sizeFromHeight(context, 4),
                        width: MediaQueryHelper.sizeFromHeight(context, 3.5),
                        decoration: BoxDecoration(border: Border.all()),
                        alignment:
                            message != "" ? null : Alignment.center,
                        child: message != ""
                            ? Image.network(
                                message,
                                fit: BoxFit.cover,
                              )
                            : CircularProgressIndicator(),
                      ),
                    ),
                  )
          ],
        ),
      ],
    );
  }
}
class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}