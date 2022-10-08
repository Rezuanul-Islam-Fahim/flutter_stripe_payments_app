import '../../../models/auth_result.dart';

enum AuthStatus {
  loginSuccess,
  registerSuccess,
  wrongPassword,
  invalidEmail,
  userDisabled,
  userNotFound,
  emailAlreadyInUse,
  operationNotAllowed,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static AuthStatus getAuthStatus(String code) {
    AuthStatus? status;

    switch (code) {
      case 'wrong-password':
        status = AuthStatus.wrongPassword;
        break;
      case 'invalid-email':
        status = AuthStatus.invalidEmail;
        break;
      case 'user-disabled':
        status = AuthStatus.userDisabled;
        break;
      case 'user-not-found':
        status = AuthStatus.userNotFound;
        break;
      case 'email-already-in-use':
        status = AuthStatus.emailAlreadyInUse;
        break;
      case 'operation-not-allowed':
        status = AuthStatus.operationNotAllowed;
        break;
      case 'weak-password':
        status = AuthStatus.weakPassword;
        break;
      default:
        status = AuthStatus.unknown;
    }

    return status;
  }

  static AuthResult getAuthResult(AuthStatus? status) {
    AuthResult result;

    switch (status) {
      case AuthStatus.loginSuccess:
        result = const AuthResult(
          title: 'Success',
          content: 'You\'ve successfully logged in',
        );
        break;
      case AuthStatus.registerSuccess:
        result = const AuthResult(
          title: 'Success',
          content: 'You\'ve successfully created a new account',
        );
        break;
      case AuthStatus.wrongPassword:
        result = const AuthResult(
          title: 'Wrong Password',
          content: 'Looks like you\'ve entered a wrong password',
        );
        break;
      case AuthStatus.invalidEmail:
        result = const AuthResult(
          title: 'Invalid Email',
          content: 'The email you\'ve entered is not a valid email',
        );
        break;
      case AuthStatus.userDisabled:
        result = const AuthResult(
          title: 'User Disabled',
          content: 'User with this account is disabled',
        );
        break;
      case AuthStatus.userNotFound:
        result = const AuthResult(
          title: 'Not Found',
          content: 'Looks like account with this email is not registered',
        );
        break;
      case AuthStatus.emailAlreadyInUse:
        result = const AuthResult(
          title: 'Already Registered',
          content: 'An account with this email is already registered',
        );
        break;
      case AuthStatus.operationNotAllowed:
        result = const AuthResult(
          title: 'Not Allowed',
          content: 'You are not allowed to do this operation',
        );
        break;
      case AuthStatus.weakPassword:
        result = const AuthResult(
          title: 'Weak Password',
          content: 'Your pasword is weak. Try using a strong password',
        );
        break;
      default:
        result = const AuthResult(
          title: 'Unknown',
          content: 'Unknown error occurred',
        );
    }

    return result;
  }
}
