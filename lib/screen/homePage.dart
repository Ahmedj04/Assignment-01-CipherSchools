import 'package:cipher_school/screen/courseScreen.dart';
import 'package:cipher_school/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hovering/hovering.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/custom_sidebar.dart';
import '../widgets/hover_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<CollapsibleItem> _items;

  TextStyle style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 2,
  );

  int iconIndex = 0;
  final Screens = [
    HomeScreen(),
    CourseScreen(),
  ];


  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        isSelected: true,
        onPressed: () {
          setState(() {
            iconIndex = 0;
          });
        },
      ),
      CollapsibleItem(
        text: 'Courses',
        icon: Icons.apartment_outlined,
        // isSelected: true,
        onPressed: () {
          setState(() {
            iconIndex = 1;
          });
        },
      ),
      CollapsibleItem(
        text: 'trending',
        icon: Icons.trending_up_sharp,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Following',
        icon: Icons.add,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Discord',
        icon: Icons.discord,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Feedback',
        icon: Icons.feedback,
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CollapsibleSidebar(
            borderRadius: 0,
            toggleButtonIcon: Icons.menu,
            isCollapsed: MediaQuery
                .of(context)
                .size
                .width <= 1900,
            items: _items,
            minWidth: 63,
            iconSize: 22,
            topPadding: 25,
            selectedIconBox: Color(0xFFF37D1F),
            selectedIconColor: Color(0xFFFEFEFE),
            selectedTextColor: Color(0xFFFEFEFE),
            collapseOnBodyTap: false,
            onTitleTap: () {
              print("title tapped");
            },
            // body: _body(size, context),
            body: Screens[iconIndex],
            backgroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 15,
            ),
            toggleTitleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            sidebarBoxShadow: [
              BoxShadow(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      );
  }
}
