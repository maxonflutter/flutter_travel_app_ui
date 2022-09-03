import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.width,
    required this.height,
    required this.navigator,
  }) : super(key: key);

  final double width;
  final double height;
  final GlobalKey<NavigatorState> navigator;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {'title': 'Activities', 'routeName': '/activities'},
    {'title': 'Hotels', 'routeName': '/hotels'},
    {'title': 'Flights', 'routeName': '/flights'},
    {'title': 'Restaurants', 'routeName': '/restaurants'},
  ];

  int sideBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.20,
      color: const Color(0xFF231955),
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.05),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      sideBarIndex = index;
                    });
                    widget.navigator.currentState!.pushNamed(
                      menu[index]['routeName'],
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(100, 50),
                  ),
                  child: Text(
                    menu[index]['title'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: (index == sideBarIndex)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: (index == sideBarIndex)
                              ? Colors.white
                              : Colors.white.withAlpha(200),
                          letterSpacing: 2,
                        ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RootSideBar {
  static State<SideBar>? of(BuildContext context) {
    final sideBarState = context.findAncestorStateOfType<State<SideBar>>();
    return sideBarState;
  }
}
