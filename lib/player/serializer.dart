part of 'auth.dart';

@GenSerializer()
class SignupRequestSerializer extends Serializer<SignupRequest>
    with _$SignupRequestSerializer {
  static final serializer = SignupRequestSerializer();
}

@GenSerializer()
class LoginRequestSerializer extends Serializer<LoginRequest>
    with _$LoginRequestSerializer {
  static final serializer = LoginRequestSerializer();
}
