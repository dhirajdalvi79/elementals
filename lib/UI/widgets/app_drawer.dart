import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/no_of_moles.dart';

/// App drawer with logo icon and tool for calculation.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                        'assets/images/pngs/atom_transparent_icon.png')),
                const SizedBox(
                  height: 27,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const NumberOfMoles();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Calculate No. Of Moles',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
