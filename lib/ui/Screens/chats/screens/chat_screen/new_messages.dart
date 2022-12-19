import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key? key}) : super(key: key);

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enteredMessage = '';
  File? _enteredImage;

  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile =
        await _picker.pickImage(source: src, imageQuality: 50, maxWidth: 150);

    if (pickedImageFile != null) {
      setState(() {
        _enteredImage = File(pickedImageFile.path);
      });
    } else {
      print('No Image Selected');
    }
  }

  _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;

    print('HEEEEEELELELELELELEL $user HEEEEEELELELELELELEL');

    //final userData = await FirebaseFirestore.instance.collection('users').doc().get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'username': 'ahmed',
      //'username' : userData['username'],
      'userId': user!.uid,
      'userImage': 'kkkk'
      //'userImage':userData['image_Url']
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Send a message...'),
            onChanged: (val) {
              setState(() {
                _enteredMessage = val;
              });
            },
          )),
          IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () => _pickImage(ImageSource.camera)),
          IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage)
        ],
      ),
    );
  }
}
