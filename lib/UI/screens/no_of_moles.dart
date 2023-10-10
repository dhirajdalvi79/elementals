import 'package:elementals/UI/widgets/text_field_for_calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bussiness_logic/providers/chemistry_calculations.dart';

/// Defines screen for number of mole calculation.
/// Calculation has two modes with three inputs, one mode calculate mass of an element
/// and other mode calculate number of moles.
class NumberOfMoles extends StatelessWidget {
  const NumberOfMoles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Of Moles'),
      ),
      body: const NumberOfMolesBody(),
    );
  }
}

/// Defines screen body for number of moles calculation.
class NumberOfMolesBody extends StatefulWidget {
  const NumberOfMolesBody({super.key});

  @override
  State<NumberOfMolesBody> createState() => _NumberOfMolesBodyState();
}

class _NumberOfMolesBodyState extends State<NumberOfMolesBody> {
  // Required text editing controllers
  late TextEditingController massOfElementController;
  late TextEditingController molarMassOfElementController;
  late TextEditingController numberOfMolesController;

  @override
  void initState() {
    super.initState();
    // Each controller is initialized and assigned the listener with calculate() method.
    massOfElementController = TextEditingController();
    massOfElementController.addListener(calculate);
    molarMassOfElementController = TextEditingController();
    molarMassOfElementController.addListener(calculate);
    numberOfMolesController = TextEditingController();
    numberOfMolesController.addListener(calculate);
  }

  /// Calculate the inputs with selected mode.
  void calculate() {
    MolarCalculations obj = context.read<MolarCalculations>();
    // Mode that calculate mass of an element.
    if (obj.calculateIndex == 0) {
      obj.numberOfMoles = double.tryParse(numberOfMolesController.text) ?? 0.0;
      obj.molarMassOfElement =
          double.tryParse(molarMassOfElementController.text) ?? 0.0;
      obj.calculateMassOfElement();

      massOfElementController.value =
          TextEditingValue(text: obj.massOfElement.toString());
      // Mode that calculate number of moles.
    } else {
      obj.massOfElement = double.tryParse(massOfElementController.text) ?? 0.0;
      obj.molarMassOfElement =
          double.tryParse(molarMassOfElementController.text) ?? 0.0;
      obj.calculateNumberOfMoles();

      numberOfMolesController.value =
          TextEditingValue(text: obj.numberOfMoles.toString());
    }
  }

  @override
  void dispose() {
    massOfElementController.dispose();
    molarMassOfElementController.dispose();
    numberOfMolesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // Provider is used to select the state for mode of calculation.
      child: Consumer<MolarCalculations>(
        builder: (context, obj, __) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: CalculationTextField(
                      controller: massOfElementController,
                      label: 'Mass',
                      textInputType: TextInputType.number,
                      readOnly: obj.calculateIndex == 0 ? true : false,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          obj.changeCalculationToMassOfElement();
                        },
                        child: Icon(
                          Icons.calculate,
                          color:
                              obj.calculateIndex == 0 ? Colors.redAccent : null,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: CalculationTextField(
                        controller: molarMassOfElementController,
                        label: 'Molar Mass',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // There are three input field, first and third have followed icon
                    // which can be tapped to select mode.
                    // For second field to have consistent width with other two, icon is set to invisible.
                    const Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Icon(Icons.calculate),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: CalculationTextField(
                        controller: numberOfMolesController,
                        label: 'Number Of Moles',
                        textInputType: TextInputType.number,
                        readOnly: obj.calculateIndex == 1 ? true : false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          obj.changeCalculationToNumberOfMoles();
                        },
                        child: Icon(
                          Icons.calculate,
                          color:
                              obj.calculateIndex == 1 ? Colors.redAccent : null,
                        )),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
