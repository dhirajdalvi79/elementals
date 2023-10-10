import 'package:elementals/models/elements.dart';
import 'package:flutter/material.dart';
import '../../bussiness_logic/core/element_list_manipulation.dart';

/// Builds card for each element which describes element's symbol, atomic number and mass number.
/// This card is present as individual unit in periodic table.
class ElementsCard extends StatelessWidget {
  const ElementsCard({super.key, required this.element});

  final Elements element;

  @override
  Widget build(BuildContext context) {
    double atomicMassNumber = double.tryParse(element.atomicMass) ?? 0.0;
    final Color getColor =
        PeriodicTableListHandler.getColorOfBlock(elements: element);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: getColor, width: 0.5)),
      child: element.name != 'Lanthanoids' && element.name != 'Actinoids'
          ? FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    element.number,
                    style: TextStyle(fontSize: 2.5, color: getColor),
                  ),
                  Text(
                    element.symbol,
                    style: TextStyle(fontSize: 6, color: getColor),
                  ),
                  Text(
                    element.name,
                    style: TextStyle(fontSize: 2.5, color: getColor),
                  ),
                  Text(
                    atomicMassNumber != 0.0
                        ? atomicMassNumber.toStringAsFixed(2)
                        : 'N/A',
                    style: TextStyle(fontSize: 2.5, color: getColor),
                  )
                ],
              ),
            )
          : FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    element.number,
                    style: TextStyle(fontSize: 2.5, color: getColor),
                  ),
                  Text(
                    element.name,
                    style: TextStyle(fontSize: 2.5, color: getColor),
                  ),
                ],
              ),
            ),
    );
  }
}
