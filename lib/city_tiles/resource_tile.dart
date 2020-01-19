import 'package:data/data.dart';

class CityResourceTileInfo {
  final int id;

  final String name;

  final String description;

  String get imageUrl => 'url(/static/images/cityrestiles/$id.png)';

  const CityResourceTileInfo(this.id, {this.name, this.description});
}

const cityForrest = CityResourceTileInfo(CityNodeIds.forest,
    name: 'Forrest',
    description:
        'Forrest terrain. Build Quarries around it to mine Adamantium.');

const cityMountain = CityResourceTileInfo(CityNodeIds.mountain,
    name: 'Mountain',
    description: 'Mountainous terrain. Build Magnetite mines around it to mine Magnetite.');

const citySwamp = CityResourceTileInfo(CityNodeIds.marsh,
    name: 'Swamp',
    description: 'Swamp terrain. Build Uranium mines around it to mine Uranium');

const cityResources = [cityForrest, cityMountain, citySwamp];
