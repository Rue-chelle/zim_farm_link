import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Assistant coming soon...",
          style: TextStyle(fontSize: 16, color: Colors.grey[600])),
    );
  }
}
