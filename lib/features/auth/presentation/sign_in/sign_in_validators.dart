import 'package:canal/features/auth/presentation/sign_in/sign_in_form_type.dart';
import 'package:canal/features/auth/presentation/sign_in/string_validators.dart';
import 'package:canal/localization/string_hardcoded.dart';

/// mixin class to be used for client-side email and password validation
mixin EmailAndPasswordValidators {
  /// * email validation
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  /// * min password length
  final StringValidator passwordRegisterSubmitValidator = MinLengthStringValidator(8);
  /// * non-empty 
  final StringValidator passwordSignInSubmitValidator = NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password, EmailPasswordSignInFormType formType) {
    if (formType == EmailPasswordSignInFormType.register) {
      return passwordRegisterSubmitValidator.isValid(password);
    }
    return passwordSignInSubmitValidator.isValid(password);
  }
  /// consider matches on a sealed class when more validation conditions are added.
  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
      ? "Email can't be empty".hardcoded
      : "Invalid email".hardcoded;
    
    return showErrorText ? errorText : null;
  }
  /// consider matches on a sealed class when more validation conditions are added.
  String? passwordErrorText(String password, EmailPasswordSignInFormType formType) {
    final bool showErrorText = !canSubmitPassword(password, formType);
    
    final String errorText = password.isEmpty
      ? "Password can't be empty".hardcoded
      : "Password is too short".hardcoded;
      
    return showErrorText ? errorText : null;
  }
}