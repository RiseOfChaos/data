import 'package:meta/meta.dart';

import '../resource/resource.dart';

class Levels<T> {
  final List<T> _levels;

  Levels(T level1, T level2, T level3, T level4, T level5, T level6, T level7,
      T level8, T level9, T level10)
      : _levels = <T>[
          level1,
          level2,
          level3,
          level4,
          level5,
          level6,
          level7,
          level8,
          level9,
          level10
        ];

  const Levels.list(this._levels);

  T operator [](int index) => _levels[0];

  T get level1 => _levels[0];
  T get level2 => _levels[1];
  T get level3 => _levels[2];
  T get level4 => _levels[3];
  T get level5 => _levels[4];
  T get level6 => _levels[5];
  T get level7 => _levels[6];
  T get level8 => _levels[7];
  T get level9 => _levels[8];
  T get level10 => _levels[9];

  static const zeros = Levels<int>.list([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}

class BuildingInfo {
  final int id;

  final String name;

  /// Description of the building
  final String description;

  const BuildingInfo(this.id,
      {@required this.name, @required this.description});

  String get imageUrl => "url(/static/images/buildings/$id.png)";
}

class BuildingStats {
  final BuildingInfo info;

  final Levels<ConstResource> cost;

  // final Levels<int> hitPoint;

  final Levels<int> production1;

  final Levels<int> production2;

  final Levels<int> buildTime;

  final Levels<int> rankPoint;

  final int levelReq;

  /// Is it a water building?
  final bool water;

  const BuildingStats({
    @required this.info,
    @required this.cost,
    @required this.production1,
    this.production2: Levels.zeros,
    @required this.buildTime,
    @required this.rankPoint,
    this.water: false,
    @required this.levelReq,
  });
}

const cityCenter = BuildingStats(
  info: BuildingInfo(0,
      name: 'City center',
      description:
          'The city center expands the building capacity of a city. It also '
          'provides storage space to store resources.'),
  cost: Levels.list([
    ConstResource(adamantium: 0, magnetite: 0),
    ConstResource(adamantium: 50, magnetite: 0),
    ConstResource(adamantium: 100, magnetite: 0),
    ConstResource(adamantium: 150, magnetite: 0),
    ConstResource(adamantium: 300, magnetite: 50),
    ConstResource(adamantium: 500, magnetite: 100),
    ConstResource(adamantium: 1000, magnetite: 150),
    ConstResource(adamantium: 1500, magnetite: 300),
    ConstResource(adamantium: 3000, magnetite: 500),
    ConstResource(adamantium: 5000, magnetite: 1000)
  ]),
  buildTime:
      Levels.list([0, 25, 40, 100, 1800, 9000, 30000, 60000, 93600, 134400]),
  production1: Levels.list(
      [1600, 12000, 17000, 25000, 40000, 58000, 80000, 130000, 210000, 290000]),
  production2: Levels.list([500, 500, 500, 500, 500, 500, 500, 500, 500, 500]),
  rankPoint: Levels.list([3, 9, 18, 36, 60, 90, 126, 171, 225, 300]),
  levelReq: 0,
);

const quarry = BuildingStats(
  info: BuildingInfo(1,
      name: 'Quarry',
      description:
          'Place Adamantium Quarry near as many forests as you can in order to '
          'extract Adamantium ore. Neighbouring Houses and at most one Adamantium'
          'Smithery will boost the production.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 1,
);

const ironWorks = BuildingStats(
  info: BuildingInfo(2,
      name: 'Iron works',
      description:
          'Place Iron Works neighbouring as many bogs as possible to extract Magnetite ore. '
          'Neighbouring Houses and at most one Iron Mongery will multiply production '
          'even more.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 2,
);

const house = BuildingStats(
  info: BuildingInfo(4,
      name: 'House',
      description:
          'Houses give workers and soldiers a good home. Resource production buildings '
          'neighbouring houses get production boost. Each house offers upto 100 '
          'space for military.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 1,
);

const warehouse = BuildingStats(
  info: BuildingInfo(1,
      name: 'Warehouse',
      description: 'Provides storage space to store extra resources. '
          'Warehouses can be specialized to store more of a resource by placing them '
          'next to a refinement facility for that resource. Bonuses from multiple '
          'refinement facilities will stack up.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 1,
);

const smithery = BuildingStats(
  info: BuildingInfo(4,
      name: 'Smithery',
      description:
          'Refines Adamantium produced in Quarry. Placing the smithery '
          'neighbouring as many Quarries as possible to give them a production boost. '
          'Warehouses that neighbour Smithery will also adjust their storage schemes '
          'to have extra room for Adamantium.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 6,
);

const mongery = BuildingStats(
  info: BuildingInfo(4,
      name: 'Iron Mongery',
      description:
          'Refines Magnetite produced in Iron Works. Iron Mongeries that neighbour '
          'Iron Works will give them a production boost. Warehouses touching '
          'Iron Mongeries will make additional room for storing Magnetite.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 6,
);

const uraniumMine = BuildingStats(
  info: BuildingInfo(3,
      name: 'Uranium mine',
      description:
          'Extracts Uranium ore from Uranium mines. Neighbouring Houses and at '
          'most one Enrichment plant will boost production even more.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const enrichmentPlant = BuildingStats(
  info: BuildingInfo(4,
      name: 'Enrichment plant',
      description:
          'Enriches Uranium produced in Uranium Mines. Enrichment Plants boost the '
          'production of neighbouring Uranium Mines. Warehouses neighbouring '
          'Enrichment Plants will boost the storage space for Uranium.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 6,
);

const barrack = BuildingStats(
  info: BuildingInfo(4,
      name: 'Barrack',
      description: 'Military building that recruits infantry units.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const plasmaRange = BuildingStats(
  info: BuildingInfo(4,
      name: 'Plasma range',
      description: 'Recuits ranged units that shoot Plasma rays.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const battery = BuildingStats(
  info: BuildingInfo(4,
      name: 'Battery',
      description:
          'Recuits units mounting fast moving levitated vehicles powered by nuclear batteries.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 7,
);

const artillery = BuildingStats(
  info: BuildingInfo(4,
      name: 'Artillery',
      description:
          'Recuits artillery units that specialize in using radioactive material to demolish walls and buildings.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 8,
);

const airbase = BuildingStats(
  info: BuildingInfo(4, name: 'Airbase', description: 'Recruits aircrafts.'),
  cost: Levels.list([
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
    ConstResource(adamantium: 50, magnetite: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 8,
);

const buildings = [
  cityCenter,
  quarry,
  ironWorks,
  uraniumMine,
  smithery,
  enrichmentPlant,
  warehouse,
  house,
  barrack,
  plasmaRange,
  battery,
  artillery,
  airbase
];

const resourceBuildings = [
  quarry,
  ironWorks,
  house,
  warehouse,
  smithery,
  enrichmentPlant,
  // TODO academy
];

const militaryBuildings = [
  barrack,
  plasmaRange,
  battery,
  artillery,
  airbase,
  // TODO castle
];