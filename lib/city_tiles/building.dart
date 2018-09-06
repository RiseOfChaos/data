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

const townCenter = BuildingStats(
  info: BuildingInfo(0,
      name: 'Town center',
      description:
          'The city center limits the number of buildings in a city. It also '
          'has storage and produces a bit of wood and iron so new cities can '
          'begin construction.'),
  cost: Levels.list([
    ConstResource(wood: 0, iron: 0),
    ConstResource(wood: 50, iron: 0),
    ConstResource(wood: 100, iron: 0),
    ConstResource(wood: 150, iron: 0),
    ConstResource(wood: 300, iron: 50),
    ConstResource(wood: 500, iron: 100),
    ConstResource(wood: 1000, iron: 150),
    ConstResource(wood: 1500, iron: 300),
    ConstResource(wood: 3000, iron: 500),
    ConstResource(wood: 5000, iron: 1000)
  ]),
  buildTime:
      Levels.list([0, 25, 40, 100, 1800, 9000, 30000, 60000, 93600, 134400]),
  production1: Levels.list(
      [1600, 12000, 17000, 25000, 40000, 58000, 80000, 130000, 210000, 290000]),
  production2: Levels.list([500, 500, 500, 500, 500, 500, 500, 500, 500, 500]),
  rankPoint: Levels.list([3, 9, 18, 36, 60, 90, 126, 171, 225, 300]),
  levelReq: 0,
);

const lumberCamp = BuildingStats(
  info: BuildingInfo(1,
      name: 'Lumber camp',
      description:
          'Place lumber camps near as many trees as you can in order to produce '
          'lots of wood. Lumber camp wood production will be further increased '
          'by touching houses and at most one Timber Mill.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
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
          'Place Ironworks touching as many bogs as possible to maximize production. '
          'Bungalows and at most one Ironmongery will multiply production even more.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 2,
);

const market = BuildingStats(
  info: BuildingInfo(3,
      name: 'Market',
      description:
          'Markets enable merchant caravans to set up business and will give your '
          'city up to 200 carts to ship goods over land. Additionally they '
          'will generate gold in taxes. Gold production will be further '
          'increased by every touching house.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const timberMill = BuildingStats(
  info: BuildingInfo(4,
      name: 'Timber mill',
      description:
          'Refines lumber produces in Lumber camp. Situate a timber mill touching '
          'as many lumber camps as possible to give them a production boost. '
          'Warehouses that are next to Timber Mills will also adjust their '
          'storage schemes to have extra room for lumber.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 6,
);

const ironMongery = BuildingStats(
  info: BuildingInfo(4,
      name: 'Iron mongery',
      description:
          'Refines iron produced in Iron Works. Iron Mongeries that touch Iron Works '
          'will give them a big boost in production. Warehouses touching '
          'Iron Mongeries will make additional room for storing ingots.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 6,
);

const warehouse = BuildingStats(
  info: BuildingInfo(4,
      name: 'Warehouse',
      description: 'Provides storage space of upto 10000 for each resource.'
          'Warehouses can be specialized to store more of a resource by placing them '
          'next to a refinement facility for that resource. Bonuses from multiple '
          'refinement facilities will stack up.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 1,
);

const house = BuildingStats(
  info: BuildingInfo(4,
      name: 'House',
      description:
          'Houses give workers and soldiers a good home. Resource production buildings '
          'must touch houses to get a benefit. Each house offers upto 1000 space for'
          'military.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 1,
);

const barrack = BuildingStats(
  info:
      BuildingInfo(4, name: 'Barrack', description: 'Recruits infantry units.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const archery = BuildingStats(
  info: BuildingInfo(4, name: 'Archery', description: 'Recuits ranged units.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 5,
);

const stable = BuildingStats(
  info: BuildingInfo(4, name: 'Stable', description: 'Recuits mounted units.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 7,
);

const siegeWorkshop = BuildingStats(
  info: BuildingInfo(4,
      name: 'Siege workshop', description: 'Recuits siege units.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 8,
);

const dock = BuildingStats(
  info: BuildingInfo(4,
      name: 'Dock',
      description:
          'A multi purpose (economy and military) water building. It produces '
          'merchant ships to set up business and will give your city up to '
          '200 ships to transport goods over the sea. Additionally, they enable '
          'recuitment of war ships.'),
  cost: Levels.list([
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
    ConstResource(wood: 50, iron: 50),
  ]),
  production1: Levels.list([33, 67, 100, 142, 183, 233, 292, 350, 417, 500]),
  buildTime:
      Levels.list([15, 54, 360, 2700, 6075, 12135, 22500, 36000, 56700, 86400]),
  rankPoint: Levels.list([1, 3, 6, 12, 20, 30, 42, 57, 75, 100]),
  levelReq: 8,
);

const buildings = [
  townCenter,
  lumberCamp,
  ironWorks,
  market,
  timberMill,
  ironMongery,
  warehouse,
  house,
  barrack,
  archery,
  stable,
  siegeWorkshop,
  dock
];
