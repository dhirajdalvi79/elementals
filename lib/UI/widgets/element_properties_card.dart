import 'package:flutter/material.dart';

/// Reusable widget to describe property for an element.
class ElementPropertyCard extends StatelessWidget {
  const ElementPropertyCard(
      {super.key, required this.property, required this.value});

  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(23, 23, 23, 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$property: ',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Text(
              value,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 18),
            ))
          ],
        ),
      ),
    );
  }
}
