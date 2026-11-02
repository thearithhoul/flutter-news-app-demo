import 'package:flutter/material.dart';
import 'package:news_custom_mobile_app/features/auth/pages/shared/login_palette.dart';

/// Oversized wordmark that fills the blue area above the form.
class LoginMasthead extends StatelessWidget {
  const LoginMasthead({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
        child: Semantics(
          header: true,
          label: 'Frontpage',
          child: ExcludeSemantics(
            child: Text(
              loginAppName,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: 76,
                fontWeight: FontWeight.w900,
                height: 0.88,
                letterSpacing: -3.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
