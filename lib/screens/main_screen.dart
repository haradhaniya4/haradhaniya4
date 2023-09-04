import 'package:admin_cp/inner_screens/all_orders_screen.dart';
import 'package:flutter/material.dart';
// import 'package:grocery_admin_panel/controllers/MenuController.dart';
// import 'package:grocery_admin_panel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../responsive.dart';
import '../widgets/side_menu.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuControllers>().getScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: AllOrdersScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
