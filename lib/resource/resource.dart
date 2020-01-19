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
    id: 1, name: "Magnetite", image: '/media/img/resource/magnetite_small.png');

const uranium = ResourceInfo(
    id: 2, name: "Uranium", image: '/media/img/resource/uranium_small.png');

const resourceInfos = const [adamantium, magnetite, uranium];

abstract class ResourceBase {
  int get adamantium;

  int get magnetite;

  int get uranium;

  const ResourceBase();

  Resources get clone =>
      Resources(adamantium: adamantium, magnetite: magnetite, uranium: uranium);

  bool get isZero => adamantium == 0 && magnetite == 0 && uranium == 0;

  bool operator >(other) {
    if (other is num) {
      return adamantium > other && magnetite > other && uranium > other;
    } else if (other is ResourceBase) {
      return adamantium > other.adamantium &&
          magnetite > other.magnetite &&
          uranium > other.uranium;
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  bool operator <(other) {
    if (other is num) {
      return adamantium < other && magnetite < other && uranium < other;
    } else if (other is ResourceBase) {
      return adamantium < other.adamantium &&
          magnetite < other.magnetite &&
          uranium < other.uranium;
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  bool operator >=(other) {
    if (other is num) {
      return adamantium >= other && magnetite >= other && uranium >= other;
    } else if (other is ResourceBase) {
      return adamantium >= other.adamantium &&
          magnetite >= other.magnetite &&
          uranium >= other.uranium;
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  bool operator <=(other) {
    if (other is num) {
      return adamantium <= other && magnetite <= other && uranium <= other;
    } else if (other is ResourceBase) {
      return adamantium <= other.adamantium &&
          magnetite <= other.magnetite &&
          uranium <= other.uranium;
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  Resources operator +(other) {
    if (other is int) {
      return Resources(
          adamantium: adamantium + other,
          magnetite: magnetite + other,
          uranium: uranium + other);
    } else if (other is Resources) {
      return Resources(
          adamantium: adamantium + other.adamantium,
          magnetite: magnetite + other.magnetite,
          uranium: uranium + other.uranium);
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  Resources operator -(other) {
    if (other is int) {
      return Resources(
          adamantium: adamantium - other,
          magnetite: magnetite - other,
          uranium: uranium - other);
    } else if (other is Resources) {
      return Resources(
          adamantium: adamantium - other.adamantium,
          magnetite: magnetite - other.magnetite,
          uranium: uranium - other.uranium);
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  Resources operator *(other) {
    if (other is int) {
      return Resources(
          adamantium: adamantium * other,
          magnetite: magnetite * other,
          uranium: uranium * other);
    } else if (other is Resources) {
      return Resources(
          adamantium: adamantium * other.adamantium,
          magnetite: magnetite * other.magnetite,
          uranium: uranium * other.uranium);
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }

  Resources operator /(other) {
    if (other is int) {
      return Resources(
          adamantium: adamantium ~/ other,
          magnetite: magnetite ~/ other,
          uranium: uranium ~/ other);
    } else if (other is Resources) {
      return Resources(
          adamantium: adamantium ~/ other.adamantium,
          magnetite: magnetite ~/ other.magnetite,
          uranium: uranium ~/ other.uranium);
    } else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }
  }
}

class ConstResource extends ResourceBase {
  final int adamantium;

  final int magnetite;

  final int uranium;

  const ConstResource({this.adamantium: 0, this.magnetite: 0, this.uranium: 0});
}

class Resources extends ResourceBase {
  int adamantium;

  int magnetite;

  int uranium;

  Resources({this.adamantium: 0, this.magnetite: 0, this.uranium: 0});

  Resources.same(int value)
      : adamantium = value,
        magnetite = value,
        uranium = value;

  void clamp(other) {
    Resources oth;
    if (other is int)
      oth = Resources.same(other);
    else if (other is ResourceBase)
      oth = other;
    else {
      throw UnimplementedError("Cannot handle ${other.runtimeType}");
    }

    if (adamantium > oth.adamantium) adamantium = oth.adamantium;
    if (magnetite > oth.magnetite) magnetite = oth.magnetite;
    if (uranium > oth.uranium) uranium = oth.uranium;
  }

  int get total => adamantium + magnetite + uranium;
}
