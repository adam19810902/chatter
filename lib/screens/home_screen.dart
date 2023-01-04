import 'package:chatter/pages/calls_page.dart';
import 'package:chatter/pages/messages_page.dart';
import 'package:chatter/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/contacts_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  var index = 0;
  //home git test
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (i){
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarItem(
            index: 0,
            lable: 'message',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: onItemSelected,
          ),
          NavigationBarItem(
            index: 1,
            lable: 'message',
            icon: CupertinoIcons.bell_solid,
            onTap: onItemSelected,
          ),
          NavigationBarItem(
            index: 2,
            lable: 'message',
            icon: CupertinoIcons.phone_fill,
            onTap: onItemSelected,
          ),
          NavigationBarItem(
            index: 3,
            lable: 'message',
            icon: CupertinoIcons.person_2_fill,
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  NavigationBarItem({
    Key? key,
    //required this.onTap,
    required this.index,
    required this.lable,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
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
      ),
    );

  }
}


