import 'package:elementals/models/elements.dart';
import 'package:flutter/material.dart';

/// Create tiles for each element for list in main screen.
class ElementTiles extends StatelessWidget {
  const ElementTiles({super.key, required this.element});

  final Elements element;

  @override
  Widget build(BuildContext context) {
    double atomicMassNumber = double.tryParse(element.atomicMass) ?? 0.0;
    return Container(
      width: double.infinity,
      // height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(23, 23, 23, 1.0)),
      child: Row(
        children: [
          Container(
            width: 110,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  element.symbol,
                  style: const TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(element.name),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Atomic No.: ${element.number}'),
              const SizedBox(
                height: 2,
              ),
              Text(
                  'Atomic Mass Number: ${atomicMassNumber != 0.0 ? atomicMassNumber.toStringAsFixed(2) : 'N/A'}'),
              const SizedBox(
                height: 2,
              ),
              Text(
                  'Electronic Configuration: ${element.electronConfigurationSemantic}'),
              Text(element.category),
            ],
          )),
        ],
      ),
    );
  }
}
