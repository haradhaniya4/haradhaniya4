import 'package:admin_cp/providers/dark_theme_provider.dart';
import 'package:admin_cp/widgets/all_users.dart';
import 'package:admin_cp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

// import 'package:grocery_admin_panel/inner_screens/all_orders_screen.dart';
// import 'package:grocery_admin_panel/inner_screens/all_products.dart';
// import 'package:grocery_admin_panel/providers/dark_theme_provider.dart';
// import 'package:grocery_admin_panel/services/utils.dart';
// import 'package:grocery_admin_panel/widgets/text_widget.dart';
// import 'package:iconly/iconly.dart';
// import 'package:provider/provider.dart';

import '../inner_screens/all_orders_screen.dart';
import '../inner_screens/completed_screen.dart';
import '../services/utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.jpg",
            ),
          ),

          DrawerListTile(
            title: "Total Orders",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllOrdersScreen()));
            },
            //delivery instructions
            icon: Icons.store,
          ),

          DrawerListTile(
            title: "Completed Orders",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompletedOrderScreen()));
            },
            icon: IconlyBold.bag_2,
          ),

          DrawerListTile(
            title: "Total Users",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllusersScreen()));
            },
            icon: IconlyBold.user_2,
          ),
          // SwitchListTile(
          //     title: const Text('Theme'),
          //     secondary: Icon(themeState.getDarkTheme
          //         ? Icons.dark_mode_outlined
          //         : Icons.light_mode_outlined),
          //     value: theme,
          //     onChanged: (value) {
          //       setState(() {
          //         themeState.setDarkTheme = value;
          //       });
          //     })
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: color,
        ));
  }
}
