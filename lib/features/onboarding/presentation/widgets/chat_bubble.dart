import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Color color;
  final IconData icon;

  const ChatBubble({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      radius: 24,
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
