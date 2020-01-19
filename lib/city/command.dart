import 'package:data/city/city.dart';
import 'package:data/data.dart';

enum CommandType {
  loot,
  support,
  plunder,
  assault,
  siege,
}

enum CommandState {
  going,
  returning,
  staying,
}

class Command {
  String id;

  CommandType type;

  Troops troops;

  String fromId;

  String toId;

  Resources loot;

  DateTime startedAt;

  DateTime finishesAt;

  CommandState state;

  Command({
    this.id,
    this.type,
    this.troops,
    this.loot,
    this.fromId,
    this.toId,
    this.startedAt,
    this.finishesAt,
    this.state,
  });
}

class OnSupport {
  String id;

  String fromId;

  Troops troops;

  DateTime arrivesAt;

  OnSupport({
    this.id,
    this.fromId,
    this.troops,
    this.arrivesAt,
  });
}

class IncomingAttack {
  String id;

  String fromId;

  DateTime hitsAt;

  IncomingAttack({
    this.id,
    this.fromId,
    this.hitsAt,
  });
}

class AssaultReq {
  Troops troops;

  String toId;
}

class AssaultErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const notEnoughTroop = 2;

  static const notCastled = 3;

  static const toCityNotFound = 4;

  static const cannotAttackSelf = 5;

  static const cannotAttackOwnAlliance = 6;

  static const toCityNotCastled = 7;

  static const notReachable = 8;
}

class CancelCmdErrors422 {
  static const cityNotYours = 0;

  static const cmdNotFound = 1;

  static const cannotBeSupportOrLoot = 2;

  static const alreadyReturning = 3;

  static const tooLateToCancel = 4;
}

class SendBackSupportErrors422 {
  static const cityNotYours = 0;

  static const cmdNotFound = 1;

  static const cannotBeSupportOrLoot = 2;

  static const alreadyReturning = 3;

  static const tooLateToCancel = 4;
}