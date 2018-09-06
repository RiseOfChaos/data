abstract class ResourceBase {
  int get wood;

  int get iron;

  int get gold;

  int get valour;
}

class ConstResource implements ResourceBase {
  final int wood;

  final int iron;

  final int gold;

  final int valour;

  const ConstResource(
      {this.wood: 0, this.iron: 0, this.gold: 0, this.valour: 0});
}

class Resources implements ResourceBase {
  int wood;

  int iron;

  int gold;

  int valour;

  Resources({this.wood: 0, this.iron: 0, this.gold: 0, this.valour: 0});
}
