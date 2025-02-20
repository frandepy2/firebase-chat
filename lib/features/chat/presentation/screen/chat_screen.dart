import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/features/auth/presentation/screens/auth_screen.dart';
import 'package:firebase_chat/features/chat/presentation/widgets/input_field.dart';
import 'package:firebase_chat/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat";

  final String chatId;

  const ChatScreen({super.key, required this.chatId});

  bool checkProfileImage(QueryDocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return !(data['profileImageUrl'] == null);
  }

  void _logOut(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Firebase Chat App"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _logOut();
              context.go(AuthScreen.routeName);
            })],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(chatId)
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var messages = snapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      DateTime messageDate =
                          (message['timestamp'] as Timestamp).toDate();
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(messageDate);
                      bool showDateSeparator = index == messages.length - 1 ||
                          DateFormat('yyyy-MM-dd').format((messages[index + 1]
                                      ['timestamp'] as Timestamp)
                                  .toDate()) !=
                              formattedDate;
                      return Column(
                        children: [
                          if (showDateSeparator)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    DateFormat('EEE, d MMM yyyy').format(
                                        messageDate), // Lun, 12 Feb 2025
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          MessageBubble(
                            text: message['text'],
                            isMe: message['senderId'] ==
                                FirebaseAuth.instance.currentUser!.uid,
                            timestamp: message['timestamp'],
                            senderId: message['senderId'],
                            profileImageUrl: checkProfileImage(message)
                                ? message['profileImageUrl']
                                : '',
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            MessageInputField(chatId: chatId),
          ],
        ),
      ),
    );
  }
}
