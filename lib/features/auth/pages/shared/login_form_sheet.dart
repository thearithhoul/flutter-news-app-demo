import 'package:flutter/material.dart';
import 'package:news_custom_mobile_app/features/auth/pages/shared/login_field.dart';
import 'package:news_custom_mobile_app/features/auth/pages/shared/login_palette.dart';
import 'package:news_custom_mobile_app/features/auth/pages/shared/login_submit_button.dart';

class LoginFormSheet extends StatelessWidget {
  const LoginFormSheet({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
    required this.obscure,
    required this.loading,
    required this.formError,
    required this.validateEmail,
    required this.validatePassword,
    required this.onToggleObscure,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  final bool obscure;
  final bool loading;
  final String? formError;
  final FormFieldValidator<String> validateEmail;
  final FormFieldValidator<String> validatePassword;
  final VoidCallback onToggleObscure;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: LoginPalette.paper,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 32, 24, 24 + bottomInset),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign in',
                style: textTheme.headlineMedium?.copyWith(
                  color: LoginPalette.ink,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pick up your reading where you left off.',
                style: textTheme.bodyMedium?.copyWith(
                  color: LoginPalette.muted,
                ),
              ),
              const SizedBox(height: 28),
              LoginField(
                controller: email,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                validator: validateEmail,
              ),
              const SizedBox(height: 16),
              LoginField(
                controller: password,
                label: 'Password',
                obscureText: obscure,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                validator: validatePassword,
                onSubmitted: (_) => onSubmit(),
                suffix: IconButton(
                  tooltip: obscure ? 'Show password' : 'Hide password',
                  onPressed: onToggleObscure,
                  color: LoginPalette.muted,
                  icon: Icon(
                    obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: navigate to the password reset page.
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: LoginPalette.ink,
                  ),
                  child: const Text('Forgot password?'),
                ),
              ),
              if (formError != null) ...[
                Semantics(
                  liveRegion: true,
                  child: Text(
                    formError!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: LoginPalette.error,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              LoginSubmitButton(loading: loading, onPressed: onSubmit),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New here?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: LoginPalette.muted,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: navigate to the sign up page.
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: LoginPalette.ink,
                      textStyle: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    child: const Text('Create an account'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
