import 'dart:ui';

import 'package:elementals/UI/screens/element_list.dart';
import 'package:elementals/UI/widgets/app_drawer.dart';
import 'package:elementals/UI/widgets/asset_image_as_icon.dart';

import 'package:elementals/bussiness_logic/core/data_initialization.dart';

import 'package:elementals/themes/theme1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UI/screens/periodic_table.dart';
import 'bussiness_logic/providers/chemistry_calculations.dart';
import 'bussiness_logic/providers/screen_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch data from JSON and initialize for app to use.
  PeriodicTableData.data = await PeriodicTableData.getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Setting providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenState()),
        ChangeNotifierProvider(create: (_) => MolarCalculations()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flexible space and clipping to restrict the blurring of body of scaffold
        flexibleSpace: ClipRRect(
          // BackdropFilter is used to add effect for transparent frozen glass.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0.0,
        title: const Text('Elementals'),
        // Following action list contain icons which upon tapping set the different
        // screen state i.e. of periodic table and elements in list.
        actions: [
          GestureDetector(
              onTap: () {
                var obj = context.read<HomeScreenState>();
                obj.changeToFirst();
              },
              child: const IconImage(path: 'assets/images/pngs/PTT_white.png')),
          const SizedBox(
            width: 30,
          ),
          GestureDetector(
              onTap: () {
                var obj = context.read<HomeScreenState>();
                obj.changeToSecond();
              },
              child: const IconImage(path: 'assets/images/pngs/PTB_white.png')),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      // Setting consumers for getting state of screen.
      body: Consumer<HomeScreenState>(
        builder: (context, obj, __) {
          // Setting the screen with respect to the screen state.
          return homeScreens[obj.index];
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}

/// List of two screens which to be displayed on main screen.
final List<Widget> homeScreens = [
  const PeriodicTable(),
  const ElementsList(),
];
