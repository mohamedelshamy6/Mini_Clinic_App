import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'messages.dart';
import 'new_messages.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),actions: [
          DropdownButton(
              icon: Icon(Icons.more_vert,color: Theme.of(context).primaryIconTheme.color,),
              items:[
                DropdownMenuItem(child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Logout')
                  ],
                ),value: 'Logout',),
              ],
          onChanged: (itemIdentifier){
            if(itemIdentifier=='Logout')
              {
                FirebaseAuth.instance.signOut();
              }
          })

      ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
