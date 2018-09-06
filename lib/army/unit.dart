import 'package:meta/meta.dart';

import '../resource/resource.dart';

class UnitType {
  final int id;

  final String name;

  const UnitType._(this.id, this.name);

  bool get isInfantry => (id & 1) != 0;

  bool get isRanged => (id & 2) != 0;

  bool get isMounted => (id & 4) != 0;

  bool get isMagic => (id & 8) != 0;

  bool get isArtillery => (id & 16) != 0;

  static const infantry = UnitType._(1, 'Infantry');

  static const ranged = UnitType._(2, 'Ranged');

  static const mounted = UnitType._(4, 'Mounted');

  static const mountedRanged = UnitType._(6, 'Mounted ranged');

  static const magic = UnitType._(8, 'Magic');

  static const artillery = UnitType._(16, 'Artillery');
}

class UnitInfo {
  final int id;

  /// Name of the unit
  final String name;

  String get namePlural => name + "s";

  /// Is the unit defensive or offensive? `false` when defensive. `true` when
  /// offensive.
  final bool offensive;

  /// Unit type.
  final UnitType unitType;

  /// Description for the unit
  final String description;

  const UnitInfo(this.id,
      {@required this.name,
      @required this.offensive,
      @required this.unitType,
      @required this.description});

  String get imageUrl => "url(/static/images/units/$id.png)";
}

class UnitStats {
  final UnitInfo info;

  /// HitPoints for the unit
  final int hitPoint;

  final int armor;
  final int pierceArmor;

  final int attackUnit;
  final int attackWall;
  final int attackBuilding;

  final int space;

  final ConstResource cost;

  // TODO recruitment speed

  // TODO Transport

  final int movementSpeed;

  const UnitStats._(
      {@required this.info,
      @required this.hitPoint,
      @required this.armor,
      @required this.pierceArmor,
      this.attackUnit,
      this.attackWall: 0,
      this.attackBuilding: 0,
      this.space: 1,
      this.movementSpeed: 1,
      @required this.cost});

  int get id => info.id;
}

const militia = UnitStats._(
    info: UnitInfo(0,
        name: 'Militia',
        offensive: true,
        description:
            "Basic offensive infantry swordsman. Quick and cheap to create.",
        unitType: UnitType.infantry),
    hitPoint: 50,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 5,
    cost: ConstResource(iron: 50));

const spearMan = UnitStats._(
    info: UnitInfo(1,
        name: 'Spearman',
        offensive: false,
        description:
            "Defensive infantry unit. Effective against mounted units.",
        unitType: UnitType.infantry),
    hitPoint: 50,
    armor: 1,
    pierceArmor: 0,
    attackUnit: 2,
    cost: ConstResource(wood: 20, iron: 70));

const skirmisher = UnitStats._(
    info: UnitInfo(2,
        name: 'Skirmisher',
        offensive: false,
        description: "Basic ranged unit. Effective against infantry.",
        unitType: UnitType.ranged),
    hitPoint: 30,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 2,
    cost: ConstResource(wood: 40, iron: 30));

const archer = UnitStats._(
    info: UnitInfo(3,
        name: 'Archer',
        offensive: false,
        description: "Ranged unit. Effective against infantry.",
        unitType: UnitType.ranged),
    hitPoint: 35,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 5,
    cost: ConstResource(wood: 30, iron: 30, gold: 30));

const knight = UnitStats._(
    info: UnitInfo(4,
        name: 'Knight',
        offensive: true,
        description:
            "Mounted unit. Effective in open field battles. High pierce armor helps them combat archer fire.",
        unitType: UnitType.mounted),
    hitPoint: 200,
    armor: 0,
    pierceArmor: 5,
    attackUnit: 10,
    space: 2,
    movementSpeed: 2,
    cost: ConstResource(iron: 100, gold: 50));

const cavalryArcher = UnitStats._(
    info: UnitInfo(5,
        name: 'Cavalry archer',
        offensive: false,
        description:
            "Fast moving archers. Defensive unit but does ok in offense.",
        unitType: UnitType.mountedRanged),
    hitPoint: 100,
    armor: 1,
    pierceArmor: 3,
    attackUnit: 5,
    space: 2,
    movementSpeed: 2,
    cost: ConstResource(wood: 100, gold: 75));

const mage = UnitStats._(
    info: UnitInfo(6,
        name: 'Mage',
        offensive: false,
        description: "Magical unit.",
        unitType: UnitType.magic),
    hitPoint: 30,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 12,
    cost: ConstResource(gold: 150, valour: 50));

const dragonRider = UnitStats._(
    info: UnitInfo(7,
        name: 'Dragon riders',
        offensive: true,
        description: "Magical unit. Weak against mage.",
        unitType: UnitType.magic),
    hitPoint: 100,
    armor: 0,
    pierceArmor: 2,
    attackUnit: 10,
    attackBuilding: 4,
    cost: ConstResource(gold: 150, valour: 100));

const ram = UnitStats._(
    info: UnitInfo(8,
        name: 'Ram',
        offensive: true,
        description: "Effective aginst walls.",
        unitType: UnitType.artillery),
    hitPoint: 50,
    armor: 0,
    pierceArmor: 5,
    attackUnit: 2,
    attackWall: 10,
    attackBuilding: 2,
    cost: ConstResource(iron: 50, gold: 50));

const catapult = UnitStats._(
    info: UnitInfo(9,
        name: 'Catapults',
        offensive: true,
        description: "Effective against buildings.",
        unitType: UnitType.artillery),
    hitPoint: 50,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 2,
    attackWall: 2,
    attackBuilding: 10,
    cost: ConstResource(iron: 100, gold: 100));

const frigate = UnitStats._(
    info: UnitInfo(10,
        name: 'Frigate',
        offensive: true,
        description: "Carries troops. Effective aginst walls.",
        unitType: UnitType.artillery),
    hitPoint: 50,
    armor: 0,
    pierceArmor: 5,
    attackUnit: 2,
    attackWall: 15,
    attackBuilding: 0,
    cost: ConstResource(wood: 100, iron: 100, gold: 50));

const canonGalleon = UnitStats._(
    info: UnitInfo(11,
        name: 'Canon galleon',
        offensive: true,
        description: "Effective against buildings.",
        unitType: UnitType.artillery),
    hitPoint: 50,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 2,
    attackWall: 2,
    attackBuilding: 12,
    cost: ConstResource(wood: 100, iron: 100, gold: 100));

const units = [
  militia,
  spearMan,
  skirmisher,
  archer,
  knight,
  cavalryArcher,
  mage,
  dragonRider,
  ram,
  catapult,
  frigate,
  canonGalleon,
];
