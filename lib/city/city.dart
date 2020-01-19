import 'dart:math';

import 'package:data/data.dart';
import 'package:data/resource/resource.dart';

export 'command.dart';
export 'construction.dart';
export 'recruitment.dart';
export 'trade.dart';

abstract class C {
  static const int totalSlots = numRows * numCols;

  static const int numRows = 10;

  static const int numCols = 10;

  static bool isBuilding(int type) => type < 100;

  static const cartCapacity = 1000;

  static const ccPos0 = ((numRows ~/ 2) * numCols) + numCols ~/ 2;

  static const ccPos1 = ((numRows ~/ 2) * numCols) + ((numCols ~/ 2) + 1);

  static const ccPos2 = (((numRows ~/ 2) + 1) * numCols) + (numCols ~/ 2);

  static const ccPos3 = (((numRows ~/ 2) + 1) * numCols) + ((numCols ~/ 2) + 1);

  static const ccPosMap = {
    ccPos0: true,
    ccPos1: true,
    ccPos2: true,
    ccPos3: true
  };
}

class Pos {
  int x;

  int y;

  Pos({this.x = 0, this.y = 0});

  factory Pos.fromString(String str) {
    final intForm = int.tryParse(str);
    if (intForm == null) {
      throw ArgumentError.value(str, "not a number");
    }

    if (intForm.isNegative) {
      throw ArgumentError.value(str, "cannot be negative");
    }

    if (intForm >= C.totalSlots) {
      throw ArgumentError.value(str, "not in range");
    }

    int x = intForm % C.numCols;
    int y = intForm ~/ C.numCols;

    return Pos(x: x, y: y);
  }

  int get oneDForm => (y * C.numCols) + x;

  bool isSame(Pos other) => x == other.x && y == other.y;
}

class CityView {}

class TimedResources {
  Resources was;

  Resources rate;

  DateTime at;

  Resources max;

  TimedResources({this.was, this.at, this.rate, this.max});

  Resources amount(DateTime now) {
    return (was + (rate * now.difference(at).inSeconds) / (60 * 60))
      ..clamp(max);
  }

  TimedResources get clone =>
      TimedResources(was: was.clone, rate: rate.clone, at: at, max: max.clone);

  TimedResources add(ResourceBase resources, DateTime now) {
    was = ((was + (rate * now.difference(at).inSeconds) / 3600) + resources)
      ..clamp(max);
    at = now;
  }

  TimedResources subtract(ResourceBase resources, DateTime now) {
    was = ((was + (rate * now.difference(at).inSeconds) / 3600) - resources)
      ..clamp(max);
    at = now;
  }
}

class WorldPos {
  int x;

  int y;

  WorldPos({this.x = 0, this.y = 0});

  factory WorldPos.fromString(String str) {
    final strParts = str.split(':');

    if (strParts.length != 2) {
      throw ArgumentError.value(str, "invalid num of parts");
    }

    final x = int.tryParse(str);
    if (x == null) {
      throw ArgumentError.value(str, "x is not a number");
    }
    if (x.isNegative) {
      throw ArgumentError.value(str, "x cannot be negative");
    }
    /*if (x >= C.totalSlots) {
      throw ArgumentError.value(str, "not in range");
    }*/

    final y = int.tryParse(str);
    if (y == null) {
      throw ArgumentError.value(str, "y is not a number");
    }
    if (y.isNegative) {
      throw ArgumentError.value(str, "y cannot be negative");
    }
    /*if (y >= C.totalSlots) {
      throw ArgumentError.value(str, "not in range");
    }*/

    return WorldPos(x: x, y: y);
  }

  double distance(WorldPos other) {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }

  bool isSame(Pos other) => x == other.x && y == other.y;

  String toString() => '$x:$y';
}
