import 'package:flutter/material.dart';

/// Reusable widget to describe legend on periodic table.
class Legend extends StatelessWidget {
  const Legend({super.key, required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
            height: 17,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
