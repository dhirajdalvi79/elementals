/// This class maps and handles list of all elements.
class PeriodicTableDataModel {
  PeriodicTableDataModel({
    required this.elements,
  });

  /// Holds all elements
  late final List<Elements> elements;

  /// Maps every elements from JSON to List
  PeriodicTableDataModel.fromJson(Map<String, dynamic> json) {
    elements =
        List.from(json['elements']).map((e) => Elements.fromJson(e)).toList();
  }
}

/// This class defines model for individual element in periodic table.
class Elements {
  /// Creates object of an element.
  Elements({
    required this.name,
    required this.appearance,
    required this.atomicMass,
    required this.boil,
    required this.category,
    required this.density,
    required this.discoveredBy,
    required this.melt,
    required this.molarHeat,
    required this.namedBy,
    required this.number,
    required this.period,
    required this.group,
    required this.phase,
    required this.source,
    required this.bohrModelImage,
    required this.bohrModel_3d,
    required this.spectralImg,
    required this.summary,
    required this.symbol,
    required this.xpos,
    required this.ypos,
    required this.wxpos,
    required this.wypos,
    required this.shells,
    required this.electronConfiguration,
    required this.electronConfigurationSemantic,
    required this.electronAffinity,
    required this.electronegativityPauling,
    required this.ionizationEnergies,
    required this.cpkHex,
    required this.image,
    required this.block,
  });

  late final String name;
  late final String appearance;
  late final String atomicMass;
  late final String boil;
  late final String category;
  late final String density;
  late final String discoveredBy;
  late final String melt;
  late final String molarHeat;
  late final String namedBy;
  late final String number;
  late final int period;
  late final int group;
  late final String phase;
  late final String source;
  late final String bohrModelImage;
  late final String bohrModel_3d;
  late final String spectralImg;
  late final String summary;
  late final String symbol;
  late final int xpos;
  late final int ypos;
  late final int wxpos;
  late final int wypos;
  late final List<int> shells;
  late final String electronConfiguration;
  late final String electronConfigurationSemantic;
  late final String electronAffinity;
  late final String electronegativityPauling;
  late final List<int> ionizationEnergies;
  late final String cpkHex;
  late final ImageModel image;
  late final String block;

  // Create object of an element from JSON.
  Elements.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString() ?? 'N/A';
    appearance = json['appearance']?.toString() ?? 'N/A';
    atomicMass = json['atomic_mass']?.toString() ?? 'N/A';
    boil = json['boil']?.toString() ?? 'N/A';
    category = json['category']?.toString() ?? 'N/A';
    density = json['density']?.toString() ?? 'N/A';
    discoveredBy = json['discovered_by']?.toString() ?? 'N/A';
    melt = json['melt']?.toString() ?? 'N/A';
    molarHeat = json['molar_heat']?.toString() ?? 'N/A';
    namedBy = json['named_by']?.toString() ?? 'N/A';
    number = json['number']?.toString() ?? 'N/A';
    period = json['period'];
    group = json['group'];
    phase = json['phase']?.toString() ?? 'N/A';
    source = json['source']?.toString() ?? 'N/A';
    bohrModelImage = json['bohr_model_image']?.toString() ?? 'N/A';
    bohrModel_3d = json['bohr_model_3d']?.toString() ?? 'N/A';
    spectralImg = json['spectral_img']?.toString() ?? 'N/A';
    summary = json['summary']?.toString() ?? 'N/A';
    symbol = json['symbol']?.toString() ?? 'N/A';
    xpos = json['xpos'];
    ypos = json['ypos'];
    wxpos = json['wxpos'];
    wypos = json['wypos'];
    shells = List.castFrom<dynamic, int>(json['shells']);
    electronConfiguration = json['electron_configuration']?.toString() ?? 'N/A';
    electronConfigurationSemantic =
        json['electron_configuration_semantic']?.toString() ?? 'N/A';
    electronAffinity = json['electron_affinity']?.toString() ?? 'N/A';
    electronegativityPauling =
        json['electronegativity_pauling']?.toString() ?? 'N/A';
    ionizationEnergies =
        List.castFrom<dynamic, int>(json['ionization_energies']);
    cpkHex = json['cpk-hex']?.toString() ?? 'N/A';
    image = ImageModel.fromJson(json['image']);
    block = json['block']?.toString() ?? 'N/A';
  }
}

/// This class defines model for an image source of an element.
class ImageModel {
  ImageModel({
    required this.title,
    required this.url,
    required this.attribution,
  });

  late final String title;
  late final String url;
  late final String attribution;

  ImageModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['url'] = url;
    data['attribution'] = attribution;
    return data;
  }
}
