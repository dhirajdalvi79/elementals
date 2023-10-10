import 'package:flutter/material.dart';

/// Handles Calculation for mass, molar mass and number of moles for element
/// and also handles calculation state.
class MolarCalculations with ChangeNotifier {
  /// Holds value for mass of element.
  double massOfElement = 0.0;

  /// Holds value for molar mass of element.
  double molarMassOfElement = 0.0;

  /// Holds value for number of moles.
  double numberOfMoles = 0.0;

  /// Holds the state for modes of calculation.
  int calculateIndex = 0;

  /// Calculate number of moles and set the state for the same.
  void calculateNumberOfMoles() {
    numberOfMoles = massOfElement / molarMassOfElement;
    if (numberOfMoles.isNaN) {
      numberOfMoles = 0.0;
    }
    notifyListeners();
  }

  /// Calculate mass of element and set the state for the same.
  void calculateMassOfElement() {
    massOfElement = numberOfMoles * molarMassOfElement;
    if (massOfElement.isNaN) {
      massOfElement = 0.0;
    }
    notifyListeners();
  }

  /// Change calculation mode to calculating number of moles.
  void changeCalculationToNumberOfMoles() {
    calculateIndex = 1;
    notifyListeners();
  }

  /// Change calculation mode to calculating mass of element.
  void changeCalculationToMassOfElement() {
    calculateIndex = 0;
    notifyListeners();
  }
}
