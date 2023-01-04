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
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: CupertinoIcons.bell_solid,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: CupertinoIcons.phone_fill,
          ),
          NavigationBarItem(
            lable: 'message',
            icon: CupertinoIcons.person_2_fill,
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
    return SizedBox(
        height: 70,
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size:20,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: const TextStyle(fontSize: 11),
            )
          ],
        )
    );

  }
}


