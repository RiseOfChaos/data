import 'package:meta/meta.dart';

import '../resource/resource.dart';

const maxCommandCancelDuration = Duration(minutes: 15);

abstract class UnitIds {
  static const brute = 0;
  static const viper = 1;
  static const alphaGuardian = 2;
  static const plasmaRanger = 3;
  static const stingray = 4;
  static const blaster = 5;
  static const catapult = 6;
}

class UnitStats {
  final int id;

  /// Name of the unit
  final String name;

  String get namePlural => name + "s";

  /// Is the unit defensive or offensive? `false` when defensive. `true` when
  /// offensive.
  final bool offensive;

  /// Description for the unit
  final String description;

  /// HitPoints for the unit
  final int hitPoint;

  final int armor;
  final int pierceArmor;

  final int attackUnit;
  final int attackWall;
  final int attackBuilding;

  final int space;

  final ConstResource cost;

  final int recruitmentSpeed;

  // TODO Transport

  final int movementSpeed;

  final int minBuildingLevelRequired;

  const UnitStats._(
    this.id, {
    @required this.name,
    @required this.offensive,
    @required this.description,
    @required this.hitPoint,
    @required this.armor,
    @required this.pierceArmor,
    this.attackUnit,
    this.attackWall: 0,
    this.attackBuilding: 0,
    this.space: 1,
    this.movementSpeed: 1,
    @required this.recruitmentSpeed,
    @required this.cost,
    this.minBuildingLevelRequired,
  });

  String get imageUrl => "url(/static/images/units/$id.png)";
}

const brute = UnitStats._(UnitIds.brute,
    name: 'Brute',
    offensive: true,
    description:
        "Basic offensive infantry swordsman. Quick and cheap to create.",
    hitPoint: 50,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 5,
    cost: ConstResource(magnetite: 50));

const viper = UnitStats._(UnitIds.viper,
    name: 'Viper',
    offensive: false,
    description: "Defensive infantry unit. Effective against mounted units.",
    hitPoint: 50,
    armor: 1,
    pierceArmor: 0,
    attackUnit: 2,
    cost: ConstResource(adamantium: 20, magnetite: 70));

const alphaGuardian = UnitStats._(UnitIds.alphaGuardian,
    name: 'Alpha guardian',
    offensive: false,
    description: "Basic ranged unit. Effective against infantry.",
    hitPoint: 30,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 2,
    cost: ConstResource(adamantium: 40, magnetite: 30));

const plasmaRanger = UnitStats._(UnitIds.plasmaRanger,
    name: 'Plasma ranger',
    offensive: false,
    description: "Ranged unit. Effective against infantry.",
    hitPoint: 35,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 5,
    cost: ConstResource(adamantium: 30, magnetite: 30, uranium: 30));

const stingray = UnitStats._(UnitIds.stingray,
    name: 'Stingray',
    offensive: true,
    description:
        "Mounted unit. Effective in open field battles. High pierce armor helps them combat archer fire.",
    hitPoint: 200,
    armor: 0,
    pierceArmor: 5,
    attackUnit: 10,
    space: 2,
    movementSpeed: 2,
    cost: ConstResource(magnetite: 100, uranium: 50));

const blaster = UnitStats._(UnitIds.blaster,
    name: 'Blaster',
    offensive: false,
    description: "Fast moving archers. Defensive unit but does ok in offense.",
    hitPoint: 100,
    armor: 1,
    pierceArmor: 3,
    attackUnit: 5,
    space: 2,
    movementSpeed: 2,
    cost: ConstResource(adamantium: 100, uranium: 75));

const catapult = UnitStats._(UnitIds.catapult,
    name: 'Catapult',
    offensive: false,
    description: "Magical unit.",
    hitPoint: 30,
    armor: 0,
    pierceArmor: 0,
    attackUnit: 12,
    cost: ConstResource(uranium: 150));

const units = [
  brute,
  viper,
  alphaGuardian,
  plasmaRanger,
  stingray,
  blaster,
  catapult,
];

const meleeUnits = <UnitStats>[
  brute,
  viper,
  alphaGuardian,
];

const rangedUnits = <UnitStats>[
  plasmaRanger,
  stingray,
];

const siegeUnits = <UnitStats>[
  blaster,
  catapult,
];
