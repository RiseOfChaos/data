import 'package:data/data.dart';

class Troops {
  int brutes;

  int viper;

  int alphaGuardian;

  int plasmaRanger;

  int stingray;

  int blaster;

  int catapult;

  Troops(
      {this.brutes = 0,
      this.viper = 0,
      this.alphaGuardian = 0,
      this.plasmaRanger = 0,
      this.stingray = 0,
      this.blaster = 0,
      this.catapult = 0});

  Troops get clone => Troops(
      brutes: brutes,
      viper: viper,
      alphaGuardian: alphaGuardian,
      plasmaRanger: plasmaRanger,
      stingray: stingray,
      blaster: blaster,
      catapult: catapult);

  int operator [](int type) {
    switch (type) {
      case UnitIds.brute:
        return brutes;
      case UnitIds.viper:
        return viper;
      case UnitIds.alphaGuardian:
        return alphaGuardian;
      case UnitIds.plasmaRanger:
        return plasmaRanger;
      case UnitIds.stingray:
        return stingray;
      case UnitIds.blaster:
        return blaster;
      case UnitIds.catapult:
        return catapult;
    }

    return null;
  }

  void operator []=(int type, int value) {
    switch (type) {
      case UnitIds.brute:
        brutes = value;
        break;
      case UnitIds.viper:
        viper = value;
        break;
      case UnitIds.alphaGuardian:
        alphaGuardian = value;
        break;
      case UnitIds.plasmaRanger:
        plasmaRanger = value;
        break;
      case UnitIds.stingray:
        stingray = value;
        break;
      case UnitIds.blaster:
        blaster = value;
        break;
      case UnitIds.catapult:
        catapult = value;
        break;
    }
  }

  bool get isZero =>
      brutes == 0 &&
      viper == 0 &&
      alphaGuardian == 0 &&
      plasmaRanger == 0 &&
      stingray == 0 &&
      blaster == 0 &&
      catapult == 0;

  Troops operator +(other) => clone..add(other);

  Troops operator -(other) => clone..subtract(other);

  void add(other) {
    if (other is int) {
      for (int i = 0; i < units.length; i++) {
        this[i] += other;
      }
    } else if (other is Troops) {
      for (int i = 0; i < units.length; i++) {
        this[i] += other[i];
      }
    }
  }

  void subtract(other) {
    if (other is int) {
      for (int i = 0; i < units.length; i++) {
        this[i] -= other;
      }
    } else if (other is Troops) {
      for (int i = 0; i < units.length; i++) {
        this[i] -= other[i];
      }
    }
  }

  void multiply(other) {
    if (other is int) {
      for (int i = 0; i < units.length; i++) {
        this[i] *= other;
      }
    } else if (other is Troops) {
      for (int i = 0; i < units.length; i++) {
        this[i] *= other[i];
      }
    }
  }

  void divide(other) {
    if (other is int) {
      for (int i = 0; i < units.length; i++) {
        this[i] ~/= other;
      }
    } else if (other is Troops) {
      for (int i = 0; i < units.length; i++) {
        this[i] ~/= other[i];
      }
    }
  }

  bool operator >(Troops other) {
    for (int i = 0; i < units.length; i++) {
      if (this[i] <= other[i]) return false;
    }

    return true;
  }

  bool operator <(Troops other) {
    for (int i = 0; i < units.length; i++) {
      if (this[i] >= other[i]) return false;
    }

    return true;
  }

  bool operator >=(Troops other) {
    for (int i = 0; i < units.length; i++) {
      if (this[i] < other[i]) return false;
    }

    return true;
  }

  bool operator <=(Troops other) {
    for (int i = 0; i < units.length; i++) {
      if (this[i] > other[i]) return false;
    }

    return true;
  }

  bool operator ==(other) {
    for (int i = 0; i < units.length; i++) {
      if (this[i] != other[i]) return false;
    }

    return true;
  }
}

class Recruitment {
  String id;

  int type;

  int amount;

  DateTime startedAt;

  DateTime finishesAt;

  int duration;

  Resources resources;

  Recruitment(
      {this.id,
      this.type,
      this.amount,
      this.startedAt,
      this.finishesAt,
      this.duration,
      this.resources});

  bool get hasStarted => startedAt != null;
}

class RecruitErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const notResearched = 2;

  static const notEnoughTroopSpace = 3;

  static const notEnoughResources = 4;
}

class DischargeErrors422 {
  static const cityNotYours = 0;

  static const notEnoughTroops = 1;

  static const not = 2;
}
