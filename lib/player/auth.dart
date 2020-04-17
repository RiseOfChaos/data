import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'serializer.dart';

part 'auth.jser.dart';

class ValidationError {
  final String field;

  final String message;

  const ValidationError(this.field, this.message);
}

class SignupRequest {
  String username;

  String email;

  String password;

  List<ValidationError> validate() {
    final ret = <ValidationError>[];

    if (username == null || username.isEmpty) {
      ret.add(ValidationError('username', 'Required'));
    } else {
      if (username.length < 4) {
        ret.add(
            ValidationError('username', 'Must be atleast 4 characters long'));
      }

      if (_usernameValidRegexp.hasMatch(username)) {
        ret.add(ValidationError(
            'username', 'Must contain only letters, numbers and underscore'));
      }
    }

    if (email == null || email.isEmpty) {
      ret.add(ValidationError('email', 'Required'));
    } else {
      // TODO is it a valid email?
    }

    if (password == null || password.isEmpty) {
      ret.add(ValidationError('password', 'Required'));
    } else {
      if (password.length < 5) {
        ret.add(
            ValidationError('password', 'Must be atleast 5 characters long'));
      }

      if (_passwordValidRegexp.hasMatch(username)) {
        ret.add(ValidationError('password',
            'Must not contain more than 2 consecutive repeating characters'));
      }
    }

    return ret;
  }

  static final _usernameValidRegexp = RegExp(r'[^a-zA-Z0-9_]');
  static final _passwordValidRegexp = RegExp(r'.{3}');
}

class LoginRequest {
  String usernameOrEmail;

  String password;

  List<ValidationError> validate() {
    final ret = <ValidationError>[];

    if (usernameOrEmail == null || usernameOrEmail.isEmpty) {
      ret.add(ValidationError('usernameOrEmail', 'Required'));
    }

    if (password == null || password.isEmpty) {
      ret.add(ValidationError('password', 'Required'));
    }

    return ret;
  }
}
