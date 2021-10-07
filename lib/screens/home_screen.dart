import 'package:chatty/helpers.dart';
import 'package:chatty/pages/messages_page.dart';
import 'package:chatty/pages/contacts_page.dart';
import 'package:chatty/pages/notifications_page.dart';
import 'package:chatty/pages/calls_page.dart';
import 'package:chatty/theme.dart';
import 'package:chatty/widgets/avatar.dart';
import 'package:chatty/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];

  final pageTitles = const ["Messages", "Notifications", "Calls", "Contacts"];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPicutreUrl()),
          )
        ],
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
              icon: Icons.search,
              onTap: () {
                print("TODO, Search icon");
              }),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          }),
      bottomNavigationBar: _bottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _bottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  const _bottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<_bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<_bottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
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
          _bottomNavigationItem(
            index: 0,
            label: "Messages",
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            isSelected: selectedIndex == 0,
            onTap: handleItemSelected,
          ),
          _bottomNavigationItem(
            index: 1,
            label: "Notifications",
            icon: CupertinoIcons.bell_solid,
            isSelected: selectedIndex == 1,
            onTap: handleItemSelected,
          ),
          _bottomNavigationItem(
            index: 2,
            label: "Calls",
            icon: CupertinoIcons.phone_fill,
            isSelected: selectedIndex == 2,
            onTap: handleItemSelected,
          ),
          _bottomNavigationItem(
            index: 3,
            label: "Contacts",
            icon: CupertinoIcons.person_2_fill,
            isSelected: selectedIndex == 3,
            onTap: handleItemSelected,
          ),
        ],
      ),
    );
  }
}

class _bottomNavigationItem extends StatelessWidget {
  final int index;
  final String label;
  final bool isSelected;
  final IconData icon;

  final ValueChanged<int> onTap;

  const _bottomNavigationItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.index,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
