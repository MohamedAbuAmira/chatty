import 'package:chatty/pages/messages_page.dart';
import 'package:chatty/pages/contacts_page.dart';
import 'package:chatty/pages/notifications_page.dart';
import 'package:chatty/pages/calls_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: _bottomNavigationBar(
        onItemSelected: (index) {
          print(index);
        },
      ),
    );
  }
}

class _bottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onItemSelected;
  const _bottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavigationItem(
            index: 0,
            label: "Messages",
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: onItemSelected,
          ),
          _bottomNavigationItem(
            index: 1,
            label: "Notifications",
            icon: CupertinoIcons.bell_solid,
            onTap: onItemSelected,
          ),
          _bottomNavigationItem(
            index: 2,
            label: "Calls",
            icon: CupertinoIcons.phone_fill,
            onTap: onItemSelected,
          ),
          _bottomNavigationItem(
            index: 3,
            label: "Contacts",
            icon: CupertinoIcons.person_2_fill,
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class _bottomNavigationItem extends StatelessWidget {
  final int index;
  final String label;
  final IconData icon;

  final ValueChanged<int> onTap;

  const _bottomNavigationItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.index,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20.0,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
