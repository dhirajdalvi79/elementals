import 'package:elementals/resources/constants.dart';
import 'package:flutter/material.dart';
import '../../models/elements.dart';

/// Handles how to arrange elements in periodic table.
class PeriodicTableListHandler {
  /// Returns list of elements with blank elements [nullElement] to fill gaps between elements
  /// to arrange elements as it is in formatted periodic table.
  static List<Elements> getPeriodicTableList(
      {required List<Elements> elements}) {
    List<Elements> getElements = elements.toList();
    getElements.insertAll(1, List.filled(16, nullElement));
    getElements.insertAll(20, List.filled(10, nullElement));
    getElements.insertAll(38, List.filled(10, nullElement));
    getElements.removeRange(92, 107);
    // Lanthanoids is just a label block for Lanthanoids
    getElements.insert(92, lanthanoids);
    getElements.removeRange(110, 125);
    // Actinoids is just a label block for Actinoids
    getElements.insert(110, actinoids);
    return getElements;
  }

  /// Returns list of Lanthanoids and Actinoids elements with blank elements [nullElement] to fill gaps between elements
  /// to arrange elements as it is in formatted periodic table.
  static List<Elements> getLanthanoidsActinoidsList(
      {required List<Elements> elements}) {
    List<Elements> getElements = elements.toList();
    getElements.removeRange(0, 56);
    getElements.removeRange(15, 32);
    getElements.removeRange(30, 46);
    getElements.insertAll(0, List.filled(3, nullElement));
    getElements.insertAll(18, List.filled(3, nullElement));
    return getElements;
  }

  /// Returns color with respect to elements residing in particular block in periodic table.
  static Color getColorOfBlock({required Elements elements}) {
    if (elements.name == 'Hydrogen') {
      return Colors.white;
    } else if (elements.category == 'alkali metal' ||
        elements.category == 'unknown, but predicted to be an alkali metal') {
      return Colors.pinkAccent;
    } else if (elements.category == 'alkaline earth metal') {
      return Colors.purpleAccent;
    } else if (elements.category.contains('nonmetal')) {
      return Colors.yellowAccent;
    } else if (elements.category == 'transition metal' ||
        elements.category == 'unknown, probably transition metal') {
      return Colors.blueAccent;
    } else if (elements.category == 'metalloid' ||
        elements.category == 'unknown, probably metalloid') {
      return Colors.amber;
    } else if (elements.category == 'noble gas' ||
        elements.category == 'unknown, predicted to be noble gas') {
      return Colors.deepOrangeAccent;
    } else if (elements.category == 'post-transition metal' ||
        elements.category == 'unknown, probably post-transition metal') {
      return Colors.greenAccent;
    } else if (elements.category == 'lanthanide' ||
        elements.name == 'Lanthanoids') {
      return Colors.cyanAccent;
    } else if (elements.category == 'actinide' ||
        elements.name == 'Actinoids') {
      return Colors.lime;
    }
    return Colors.white;
  }
}
