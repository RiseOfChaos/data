class CityResourceTileInfo {
  final int id;

  final String name;

  final String description;

  String get imageUrl => 'url(/static/images/cityrestiles/$id.png)';

  const CityResourceTileInfo(this.id, {this.name, this.description});
}

const cityForrest = CityResourceTileInfo(0,
    name: 'Forrest',
    description:
        'Forrest resource. Build Lumber Camps around it to collect wood.');

const cityBog = CityResourceTileInfo(1,
    name: 'Iron bog',
    description: 'Iron resource. Build Iron Works around it to collect iron.');

const cityResources = [cityForrest, cityBog];
