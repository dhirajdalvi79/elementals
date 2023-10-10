import 'package:elementals/UI/widgets/tiles.dart';
import 'package:flutter/material.dart';
import '../../bussiness_logic/core/data_initialization.dart';
import '../../models/elements.dart';
import 'element_info.dart';

/// Widget displaying list of all elements in sequence.
class ElementsList extends StatelessWidget {
  const ElementsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting data from JSON
    var obj = PeriodicTableDataModel.fromJson(PeriodicTableData.data);

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
                onTap: () {
                  // Each element tile in list navigate to the tapped element's information screen.
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ElementInfo(elements: obj.elements[index]);
                      },
                    ),
                  );
                },
                child: ElementTiles(element: obj.elements[index])),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: obj.elements.length);
  }
}
