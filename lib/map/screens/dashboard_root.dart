import 'package:flutter/material.dart';
import 'package:map/map/screens/marketplace_screen.dart';

class DashboardRoot extends StatefulWidget {
  const DashboardRoot({super.key});

  @override
  State<DashboardRoot> createState() => _DashboardRootState();
}

class _DashboardRootState extends State<DashboardRoot> {
  int _selectedIndex = 4; // Default - Map tab

  final List<Widget> _screens = const [
    MarketplaceScreen(),
    MarketplaceScreen(),
    MarketplaceScreen(),
    MarketplaceScreen(),
    MarketplaceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _screens[_selectedIndex]);
  }
}
