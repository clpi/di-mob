import 'package:dimo/view/home/community.dart';
import 'package:dimo/view/home/dash.dart';
import 'package:dimo/view/home/records.dart';
import 'package:dimo/view/home/user.dart';
import 'package:dimo/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:path/path.dart';

enum BottomBarKind {
  Labels,
  NoLabels,
}

class DlBottomBar extends StatefulWidget {
  const DlBottomBar ({
    Key key,
    // @required this.restorationId,
    @required this.type,
    this.currentIndex,
  }) : super(key: key);

  // final String restorationId;
  final BottomBarKind type;
  final int currentIndex;

  @override 
  _DlBottomBarState createState() => _DlBottomBarState();
}

class _DlBottomBarState extends State<DlBottomBar> {
  // with RestorationMixin {
  // final RestorableInt _idx = RestorableInt(0);

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = this.widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var items = [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Records",
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: "Community",
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group_rounded),
          ),
          BottomNavigationBarItem(
            label: "You",
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
          ),
    ];

    return BottomNavigationBar(
      items: items,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      selectedFontSize: textTheme.caption.fontSize,
      unselectedFontSize: textTheme.caption.fontSize,
      iconSize: 20.0,
      type: BottomNavigationBarType.fixed,
      elevation: 3.0,
      onTap: (int idx) { setState(() { currentIndex = idx; }); }
      // selectedItemColor: colorScheme.onPrimary,
      // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
      // backgroundColor: Colors.black
    );
  }


  Widget alt() {
    return BottomAppBar(
        elevation: 2.0,
        color: Colors.black12,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      );
  }
}