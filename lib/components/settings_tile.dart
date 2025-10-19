import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mySettingsTile extends StatelessWidget {
  final String title;
  final Widget action;

  const mySettingsTile({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(23.0),
      ),
      padding: EdgeInsets.all(11.0),

      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: action,
      ),
      margin: EdgeInsets.all(25.0),
    );
  }
}
