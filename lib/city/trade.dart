import 'package:data/data.dart';

class Trade {
  String id;

  int carts;

  Resources resources;

  String fromId;

  String toId;

  bool returning;

  DateTime startedAt;

  DateTime finishesAt;

  Trade(
      {this.id,
      this.carts,
      this.resources,
      this.fromId,
      this.toId,
      this.returning,
      this.startedAt,
      this.finishesAt});
}

class TradeIn {
  String id;

  Resources resources;

  String fromId;

  String toId;

  DateTime arrivesAt;

  TradeIn(
      {this.id,
      this.resources,
      this.fromId,
      this.toId,
      this.arrivesAt});
}

class TradeReq {
  Resources resources;

  String toId;

  int get cartsNeeded => (resources.total / C.cartCapacity).ceil();
}

class TradeErrors422 {
  static const cityNotYours = 0;

  static const queueFull = 1;

  static const notEnoughCarts = 2;

  static const notEnoughResources = 3;

  static const toCityNotFound = 4;
}

class CancelTradeErrors422 {
  static const cityNotYours = 0;

  static const tradeNotFound = 5;

  static const alreadyReturning = 6;
}

class CancelTradeInErrors422 {
  static const cityNotYours = 0;

  static const tradeNotFound = 5;

  static const alreadyReturning = 6;
}