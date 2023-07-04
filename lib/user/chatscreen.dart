// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      sender: 'User',
    );
    setState(() {
      _messages.insert(0, message);
    });
    _getBotResponse(text);
  }

  void _getBotResponse(String userQuery) {
    Process.run('python', ['chat.py', userQuery]).then((result) {
      String botResponse = result.stdout as String;

      ChatMessage message = ChatMessage(
        text: botResponse,
        sender: 'Smart Doctor',
      );
      setState(() {
        _messages.insert(0, message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Smart'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(sender, style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(child: Text(sender[0])),
          ),
        ],
      ),
    );
  }
}
