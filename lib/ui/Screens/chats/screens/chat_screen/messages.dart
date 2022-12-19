import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: false)
            .snapshots(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final docs = snapShot.data.docs;
          final user = FirebaseAuth.instance.currentUser;
          return ListView.builder(
              reverse: true,
              itemCount: docs.length,
              itemBuilder: (context, index) => MessageBubble(
                    docs[index]['text'],
                    docs[index]['username'],
                    docs[index]['userImage'],
                    docs[index]['userId'] == user!.uid,
                    key: ValueKey(docs[index]),
                  ));
        });
  }
}
