import 'package:elementals/UI/screens/element_info.dart';
import 'package:elementals/UI/widgets/card.dart';
import 'package:elementals/UI/widgets/legend.dart';
import 'package:elementals/bussiness_logic/core/element_list_manipulation.dart';
import 'package:flutter/material.dart';
import '../../bussiness_logic/core/data_initialization.dart';
import '../../models/elements.dart';

/// Screen Widget that sets the element in standard periodic table format and
/// the corresponding legends for different blocks in table.
class PeriodicTable extends StatelessWidget {
  const PeriodicTable({super.key});

  @override
  Widget build(BuildContext context) {
    PeriodicTableDataModel obj =
        PeriodicTableDataModel.fromJson(PeriodicTableData.data);
    // Get all elements except f-block elements
    List<Elements> getList =
        PeriodicTableListHandler.getPeriodicTableList(elements: obj.elements);
    // Get all f-block elements
    List<Elements> getLanthanoidsActinoidsList =
        PeriodicTableListHandler.getLanthanoidsActinoidsList(
            elements: obj.elements);
    // This sets the screen to be zoomable
    return InteractiveViewer(
      minScale: 1,
      maxScale: 50,
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              )
            ])),
            SliverList(
                delegate: SliverChildListDelegate([
              const Center(
                child: Text(
                  'Periodic Table',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ])),
            // This grid sets the elements (excluding f-block) in periodic table.
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                // print(obj.elements.length);
                if (getList[index].name == '') {
                  return Container();
                }
                return GestureDetector(
                  onTap: () {
                    if (getList[index].name != 'Lanthanoids' &&
                        getList[index].name != 'Actinoids') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ElementInfo(elements: getList[index]);
                          },
                        ),
                      );
                    }
                  },
                  child: ElementsCard(
                    element: getList[index],
                  ),
                );
              }, childCount: getList.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 18,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              )
            ])),
            // This grid sets the f-block elements in periodic table.
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                // print(obj.elements.length);
                if (getLanthanoidsActinoidsList[index].name == '') {
                  return Container();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ElementInfo(
                              elements: getLanthanoidsActinoidsList[index]);
                        },
                      ),
                    );
                  },
                  child: ElementsCard(
                    element: getLanthanoidsActinoidsList[index],
                  ),
                );
              }, childCount: getLanthanoidsActinoidsList.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 18,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(width: 0.7, color: Colors.white),
                ),
                // Following describes the legends for various blocks and types of element present
                // in periodic table.
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'S - Block',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Legend(color: Colors.white, label: 'Hydrogen'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(color: Colors.pinkAccent, label: 'Alkali Metals'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(
                        color: Colors.purpleAccent,
                        label: 'Alkali Earth Metals'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'P - Block',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Legend(
                        color: Colors.greenAccent,
                        label: 'Post-Transition Metals'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(color: Colors.amber, label: 'Metalloids'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(color: Colors.yellowAccent, label: 'Non-Metals'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(
                        color: Colors.deepOrangeAccent, label: 'Noble Gasses'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'D - Block',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Legend(
                        color: Colors.blueAccent, label: 'Transition Metals'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'F - Block',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Legend(color: Colors.cyanAccent, label: 'Lanthanides'),
                    SizedBox(
                      height: 7,
                    ),
                    Legend(color: Colors.lime, label: 'Actinides'),
                  ],
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
