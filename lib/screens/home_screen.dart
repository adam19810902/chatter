import 'package:chatter/pages/calls_page.dart';
import 'package:chatter/pages/messages_page.dart';
import 'package:chatter/pages/notifications_page.dart';
import 'package:chatter/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/contacts_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  //var index = 0;
  //home git test
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int index, _){
          return pages[index];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (i){
          //print(i);
          pageIndex.value = i;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(index){
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

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
            lable: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            isSelected: (selectedIndex == 0),
            onTap: handleItemSelected,
          ),
          NavigationBarItem(
            index: 1,
            lable: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            isSelected: (selectedIndex == 1),
            onTap: handleItemSelected,
          ),
          NavigationBarItem(
            index: 2,
            lable: 'Calls',
            icon: CupertinoIcons.phone_fill,
            isSelected: (selectedIndex == 2),
            onTap: handleItemSelected,
          ),
          NavigationBarItem(
            index: 3,
            lable: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            isSelected: (selectedIndex == 3),
            onTap: handleItemSelected,
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
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
                color: isSelected ? AppColors.secondary : null,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                lable,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary)
                    : const TextStyle(fontSize: 11)
              )
            ],
          )
      ),
    );

  }
}


