import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String senderId;
  final String? profileImageUrl;
  final dynamic timestamp;

  const MessageBubble({required this.text, required this.isMe, this.profileImageUrl, super.key, required this.senderId, this.timestamp});

  DateTime convertToDateTime(dynamic timestamp){
    final time = timestamp as Timestamp;

    return time.toDate();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe) // Muestra la imagen solo si el mensaje no es del usuario actual
          CircleAvatar(
            radius: 20,
            backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
          ),
        const SizedBox(width: 0), // Espaciado entre imagen y mensaje
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? const Color.fromARGB(255, 3, 6, 185) : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(8),
                topRight: const Radius.circular(8),
                bottomLeft: isMe ? const Radius.circular(8) : const Radius.circular(0),
                bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(8),
              ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7, // Máximo 70% del ancho de la pantalla
            ),
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end: CrossAxisAlignment.start, // Muestra el texto en la parte izquierda del mensaje
              children: [
                Text(
                  text,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
                SizedBox(height: 0), // Espacio entre el mensaje y la fecha
                Text(
                   DateFormat('HH:mm').format(convertToDateTime(timestamp)),
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
        if (isMe) // Si el mensaje es del usuario, muestra la imagen a la derecha
          const SizedBox(width: 0),
        if (isMe)
          CircleAvatar(
            radius: 20,
            backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
          ),
      ],
    );
  }
}
