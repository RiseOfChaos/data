enum ConstructionType {
  construct,
  upgrade,
  downgrade,
  demolish,
}

class Construction {
  String id;

  int pos;

  int buildingType;

  ConstructionType constructionType;

  DateTime startedAt;

  DateTime finishesAt;

  int duration;

  Construction(
      {this.id,
        this.pos,
        this.buildingType,
        this.constructionType,
        this.duration,
        this.startedAt,
        this.finishesAt});

  bool get hasStarted => startedAt != null;
}

class ConstructBuildingErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const cityCenterPlace = 2;

  static const notEmpty = 3;

  static const notEnoughResources = 4;

  static const notEnoughBuildingSpace = 5;
}

class UpgradeBuildingErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const cityCenterPlace = 2;

  static const empty = 3;

  static const atMaxLevel = 4;

  static const notEnoughResources = 5;
}

class DowngradeBuildingErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const cityCenterPlace = 2;

  static const cannotDowngradeConstructing = 3;

  static const empty = 4;

  static const notBuilding = 5;

  static const destroyed = 6;
}

class DemolishBuildingErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const cityCenterPlace = 2;

  static const cannotDemolishConstructing = 3;

  static const empty = 4;

  static const notBuilding = 5;

  static const destroyed = 6;
}

class CancelConstructionErrors422 {
  static const cityNotYours = 0;

  static const notFound = 1;
}