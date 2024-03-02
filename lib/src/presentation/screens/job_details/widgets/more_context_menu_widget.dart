import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';

class MoreContextMenuWidget extends StatelessWidget {
  const MoreContextMenuWidget({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          ContextMenuRegion(
            contextMenu: TextContextMenu(data: title),
            child: TextButton(
              onPressed: () {},
              child: Text(
                title,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          ContextMenuRegion(
            contextMenu: TextContextMenu(data: title),
            child: TextButton(
              onPressed: () {},
              child: Text(
                title,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
