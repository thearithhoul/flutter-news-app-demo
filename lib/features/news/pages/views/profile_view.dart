import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_custom_mobile_app/features/auth/domain/dto/user_dto.dart';
import 'package:news_custom_mobile_app/features/auth/pages/providers/auth_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/profile_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return NewsPageScaffold(
      title: 'Profile',
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              profile.when(
                data: (user) => _ProfileHeader(user: user),
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: CircularProgressIndicator(),
                ),
                error: (_, _) => Column(
                  children: [
                    const Text('Could not load profile'),
                    TextButton(
                      onPressed: () => ref.invalidate(profileProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Stat(label: 'Read', value: '128'),
                  _Stat(label: 'Saved', value: '24'),
                  _Stat(label: 'Following', value: '12'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const _MenuTile(
          icon: Icons.notifications_rounded,
          label: 'Notifications',
        ),
        const _MenuTile(icon: Icons.language_rounded, label: 'Language'),
        const _MenuTile(icon: Icons.dark_mode_rounded, label: 'Appearance'),
        _MenuTile(
          icon: Icons.logout_rounded,
          label: 'Log out',
          onTap: () async {
            await ref.read(authProvider.notifier).logout();
            if (context.mounted) context.go('/login');
          },
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final UserDto user;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = user.avatarUrl;
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: const Color(0xFFE3EEE6),
          backgroundImage: avatarUrl == null ? null : NetworkImage(avatarUrl),
          child: avatarUrl == null
              ? const Icon(Icons.person_rounded, size: 44)
              : null,
        ),
        const SizedBox(height: 12),
        Text(
          user.name ?? 'Guest Reader',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        if (user.email != null)
          Text(
            user.email!,
            style: const TextStyle(fontSize: 13, color: Color(0xFF7A807C)),
          ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF7A807C)),
        ),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: ListTile(
          leading: Icon(icon),
          title: Text(label),
          trailing: const Icon(Icons.chevron_right_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
