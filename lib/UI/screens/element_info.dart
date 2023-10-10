import 'package:elementals/models/elements.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../widgets/element_properties_card.dart';

/// Each element information screen
class ElementInfo extends StatelessWidget {
  const ElementInfo({super.key, required this.elements});

  final Elements elements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElementInfoBody(
        getElements: elements,
      ),
    );
  }
}

/// Each element information display
class ElementInfoBody extends StatelessWidget {
  const ElementInfoBody({super.key, required this.getElements});

  final Elements getElements;

  @override
  Widget build(BuildContext context) {
    // Uses CustomScrollView for keeping persistent header which contains elements atomic structure in 3D.
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: Delegate(
                element: getElements,
                getHeight: MediaQuery.of(context).size.width)),
        SliverList(
            delegate: SliverChildListDelegate([
          // Follows all information of an element.
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Appearance',
            value: getElements.appearance,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Summary',
            value: getElements.summary,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Atomic Number',
            value: getElements.number,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Atomic Mass',
            value: getElements.atomicMass,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Discovered By',
            value: getElements.discoveredBy,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Named By',
            value: getElements.namedBy,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Melting Point',
            value: '${getElements.melt} K',
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Boiling Point',
            value: '${getElements.boil} K',
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Density',
            value: '${getElements.density} (g/c\u33A5 for s/l)/(g/L for g)',
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Molar heat Capacity',
            value: getElements.molarHeat != 'N/A'
                ? '${getElements.molarHeat} J/(molK)'
                : 'N/A',
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Phase',
            value: getElements.phase,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Block',
            value: getElements.block,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Group',
            value: getElements.group.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Period',
            value: getElements.period.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Electronic \nConfiguration',
            value: getElements.electronConfiguration,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Electronic \nConfiguration(Semantics)',
            value: getElements.electronConfigurationSemantic,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Electron Affinity',
            value: getElements.electronAffinity,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Electronegativity Pauling',
            value: getElements.electronegativityPauling,
          ),
          const SizedBox(
            height: 10,
          ),
          ElementPropertyCard(
            property: 'Category',
            value: getElements.category,
          ),
          const SizedBox(
            height: 10,
          ),
        ])),
      ],
    );
  }
}

/// Custom delegate for persistent header.
class Delegate extends SliverPersistentHeaderDelegate {
  Delegate({
    required this.element,
    required this.getHeight,
  });

  final Elements element;
  final double getHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        ModelViewer(
          src: element.bohrModel_3d,
          autoPlay: true,
          backgroundColor: Colors.black,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.symbol,
                  style: const TextStyle(fontSize: 70),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  element.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => getHeight;

  @override
  double get minExtent => getHeight / 3 + 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
