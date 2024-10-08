import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/view/home/home_screen.dart';
import '../core/view/orderDetails/order_details_screen.dart';
import '../core/view/profile/profile_screen.dart';
import '../core/view/search/search_screen.dart';
import 'constants.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({
    super.key,
  });

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  // Bydefault first one is selected
  int _selectedIndex = 0;

  // List of nav items
  final List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "Home"},
    {"icon": "assets/icons/search.svg", "title": "Search"},
    {"icon": "assets/icons/order.svg", "title": "Orders"},
    {"icon": "assets/icons/profile.svg", "title": "Profile"},
  ];

// Screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const OrderDetailsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    /// If you set your home screen as first screen make sure call [SizeConfig().init(context)]

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        activeColor: theme.colorScheme.primary,
        inactiveColor: bodyTextColor,
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _navitems[index]["icon"],
              height: 30,
              width: 30,
              colorFilter: ColorFilter.mode(
                  index == _selectedIndex ? theme.colorScheme.primary : bodyTextColor,
                  BlendMode.srcIn),
            ),
            label: _navitems[index]["title"],
          ),
        ),
      ),
    );
  }
}
