import 'package:canal/features/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:canal/features/auth/presentation/sign_in/sign_in_form_type.dart';
import 'package:canal/features/auth/presentation/sign_in/sign_in_validators.dart';
import 'package:canal/features/auth/presentation/sign_in/string_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/widgets/custom_text_button.dart';
import 'package:canal/widgets/primary_button.dart';
import 'package:canal/constants/sizes.dart';
import 'package:canal/widgets/responsive_scrollable_card.dart';
/// email and password sign in screen
/// wraps the [EmailPasswordSignInContents] widget below with a [Scaffold] and
/// [AppBar] with a title.
class EmailPasswordSignInScreen extends StatelessWidget {
  const EmailPasswordSignInScreen({super.key, required this.formType});

  final EmailPasswordSignInFormType formType;
  /// * keys for testing using find.byKey()
  static const emailKey = Key("email");
  static const passwordKey = Key("password");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In".hardcoded)),
      body: EmailPasswordSignInContents(formType: formType),
    );
  }
}


/// widget for email and password authentication, supporting:
/// * sign in
/// * register (create an account)
class EmailPasswordSignInContents extends ConsumerStatefulWidget {
  const EmailPasswordSignInContents({
    super.key,
    this.onSignedIn,
    required this.formType,
  });
  final VoidCallback? onSignedIn;
  /// the default form type to use
  final EmailPasswordSignInFormType formType;

  @override
  ConsumerState<EmailPasswordSignInContents> createState() =>
    _EmailPasswordSignInContentsState();
}


class _EmailPasswordSignInContentsState 
  extends ConsumerState<EmailPasswordSignInContents>
  with EmailAndPasswordValidators {
    final _formKey = GlobalKey<FormState>();

    final _node = FocusScopeNode();

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    String get email => _emailController.text;
    String get password => _passwordController.text;
    /// local variable used to apply AutovalidateMode.onUserInteraction
    /// and show error hints only when the form has been submitted
    /// for more details on how this is implemented read here:
    /// * https://codewithandrea.com/articles/flutter-text-field-form-validation/
    var _submitted = false;
    /// track the formType as a local state variable
    late var _formType = widget.formType;

    @override
    void dispose() {
      /// TextEditingControllers should always be disposed
      _node.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    Future<void> _submit() async {
      setState(() => _submitted = true);
      /// only submit form if validation passes
      if (_formKey.currentState!.validate()) {
        final controller = ref.read(
          emailPasswordSignInControllerProvider.notifier
        );

        final success = await controller.submit(
          email: email, 
          password: password, 
          formType: _formType
        );

        if (success) {
          widget.onSignedIn?.call();
        }
      }
    }

    void _emailEditingComplete() {
      if (canSubmitEmail(email)) {
        _node.nextFocus();
      }
    }

    void _passwordEditingComplete() {
      if (!canSubmitEmail(email)) {
        _node.previousFocus();
        return;
      }

      _submit();
    }

    void _updateFormType() {
      /// toggle between register / sign in
      setState(() {
        _formType = _formType.secondaryActionFormType;
      });
      /// clear the password field when doing so
      _passwordController.clear();
    }

    /// UI
    @override
    Widget build(BuildContext context) {
      ref.listen<AsyncValue>(
        emailPasswordSignInControllerProvider, (_, state) {
          state.showAlertDialogOnError(context);
      });

      final state = ref.watch(emailPasswordSignInControllerProvider);
      return ResponsiveScrollableCard(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                gapH8,
                /// email field
                TextFormField(
                  key: EmailPasswordSignInScreen.emailKey,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email".hardcoded,
                    hintText: "test@test.com".hardcoded,
                    enabled: !state.isLoading,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => !_submitted ? null : emailErrorText(email ?? ""),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Brightness.light,
                  onEditingComplete: () => _emailEditingComplete(),
                  inputFormatters: <TextInputFormatter>[
                    ValidatorInputFormatter(editingValidator: EmailEditingRegexValidator()),
                  ],
                ),
                /// DIVIDER
                gapH8,
                /// password field
                TextFormField(
                  key: EmailPasswordSignInScreen.passwordKey,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: _formType.passwordLabelText,
                    enabled: !state.isLoading,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) => !_submitted
                      ? null
                      : passwordErrorText(password ?? '', _formType),
                  obscureText: true,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  keyboardAppearance: Brightness.light,
                  onEditingComplete: () => _passwordEditingComplete(),
                ),
                /// DIVIDER
                gapH8,
                /// bottom buttons
                PrimaryButton(
                  text: _formType.primaryButtonText,
                  isLoading: state.isLoading,
                  onPressed: state.isLoading ? null : () => _submit(),
                ),
                gapH8,
                CustomTextButton(
                  text: _formType.secondaryButtonText,
                  onPressed: state.isLoading ? null : _updateFormType,
                ),                
              ],
            ),
          ),
        ),
      );
    }
  }

