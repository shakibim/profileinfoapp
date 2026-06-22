import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoTile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 20,
        color: Colors.grey[700],
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}