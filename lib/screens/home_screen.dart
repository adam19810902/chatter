import 'package:chatter/pages/calls_page.dart';
import 'package:chatter/pages/messages_page.dart';
import 'package:chatter/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/contacts_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  //home git test

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          NavigationBarItem(
            lable: 'message',
            icon: Icons.message,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: Icons.message,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: Icons.message,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: Icons.message,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.lable,
    required this.icon
  }) : super(key: key);

  final String lable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Text(lable)
      ],
    );
  }
}


