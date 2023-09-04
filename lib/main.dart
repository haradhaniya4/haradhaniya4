import 'package:admin_cp/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:grocery_admin_panel/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';
import 'controllers/MenuController.dart';
import 'inner_screens/add_prod.dart';
import 'providers/dark_theme_provider.dart';

// import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAPDPQd6mlPdR4F5WmhDLgwW3dWCBb36f8",
        authDomain: "haraaa-2fb78.firebaseapp.com",
        projectId: "haraaa-2fb78",
        storageBucket: "haraaa-2fb78.appspot.com",
        messagingSenderId: "572895085839",
        appId: "1:572895085839:web:b2a45cddc69f943bb26a7a",
        measurementId: "G-E296VNHFWS"),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }
 final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAPDPQd6mlPdR4F5WmhDLgwW3dWCBb36f8",
        authDomain: "haraaa-2fb78.firebaseapp.com",
        projectId: "haraaa-2fb78",
        storageBucket: "haraaa-2fb78.appspot.com",
        messagingSenderId: "572895085839",
        appId: "1:572895085839:web:b2a45cddc69f943bb26a7a",
        measurementId: "G-E296VNHFWS"),
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuControllers(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'haradhaniya ',
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home: const MainScreen(),
              routes: {
                UploadProductForm.routeName: (context) =>
                    const UploadProductForm(),
              });
        },
      ),
    );
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text('App is being initialized'),
    //               ),
    //             ),
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text('An error has been occured ${snapshot.error}'),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //       return MultiProvider(
    //         providers: [
    //           ChangeNotifierProvider(
    //             create: (_) => MenuController(),
    //           ),
    //           ChangeNotifierProvider(
    //             create: (_) {
    //               return themeChangeProvider;
    //             },
    //           ),
    //         ],
    //         child: Consumer<DarkThemeProvider>(
    //           builder: (context, themeProvider, child) {
    //             return MaterialApp(
    //                 debugShowCheckedModeBanner: false,
    //                 title: 'Grocery',
    //                 theme:
    //                     Styles.themeData(themeProvider.getDarkTheme, context),
    //                 home: const MainScreen(),
    //                 routes: {
    //                   UploadProductForm.routeName: (context) =>
    //                       const UploadProductForm(),
    //                 });
    //           },
    //         ),
    //       );
    //     });
  }
}
