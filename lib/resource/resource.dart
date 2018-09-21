class ResourceInfo {
  final int id;

  final String name;

  final String image;

  const ResourceInfo({this.id, this.name, this.image});
}

const adamantium = ResourceInfo(
    id: 0,
    name: "Adamantium",
    image: '/media/img/resource/adamantium_small.png');

const magnetite = ResourceInfo(
    id: 1,
    name: "Magnetite",
    image: '/media/img/resource/magnetite_small.png');

const uranium = ResourceInfo(
    id: 2,
    name: "Uranium",
    image: '/media/img/resource/uranium_small.png');

const resourceInfos = const [adamantium, magnetite, uranium];

abstract class ResourceBase {
  int get adamantium;

  int get magnetite;

  int get uranium;
}

class ConstResource implements ResourceBase {
  final int adamantium;

  final int magnetite;

  final int uranium;

  const ConstResource(
      {this.adamantium: 0, this.magnetite: 0, this.uranium: 0});
}

class Resources implements ResourceBase {
  int adamantium;

  int magnetite;

  int uranium;

  Resources({this.adamantium: 0, this.magnetite: 0, this.uranium: 0});
}
