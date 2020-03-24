// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SignupRequestSerializer implements Serializer<SignupRequest> {
  @override
  Map<String, dynamic> toMap(SignupRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  SignupRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = SignupRequest();
    obj.username = map['username'] as String;
    obj.email = map['email'] as String;
    obj.password = map['password'] as String;
    return obj;
  }
}

abstract class _$LoginRequestSerializer implements Serializer<LoginRequest> {
  @override
  Map<String, dynamic> toMap(LoginRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'usernameOrEmail', model.usernameOrEmail);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  LoginRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = LoginRequest();
    obj.usernameOrEmail = map['usernameOrEmail'] as String;
    obj.password = map['password'] as String;
    return obj;
  }
}
