import 'package:flutter/material.dart';

/// News post card from the "Popular News" list (screen 1 of the design).
class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
    required this.sourceName,
    this.sourceLogoUrl,
    required this.timeAgo,
    required this.title,
    required this.imageUrl,
    this.isVerified = true,
    this.likes = 0,
    this.comments = 0,
    this.views = 0,
    this.onTap,
    this.onMoreTap,
    this.onShareTap,
    this.onLikeTap,
    this.onCommentTap,
  });

  final String sourceName;
  final String? sourceLogoUrl;
  final String timeAgo;
  final String title;
  final String? imageUrl;
  final bool isVerified;
  final int likes;
  final int comments;
  final int views;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;

  static const _ink = Color(0xFF111413);
  static const _muted = Color(0xFF7A807C);
  static const _chip = Color(0xFFF1F3F2);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      elevation: 0,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(
                sourceName: sourceName,
                sourceLogoUrl: sourceLogoUrl,
                timeAgo: timeAgo,
                isVerified: isVerified,
                onMoreTap: onMoreTap,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 12, 4, 10),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _ink,
                    fontSize: 17,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: imageUrl == null
                      ? const _ImagePlaceholder()
                      : Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const _ImagePlaceholder(),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _StatChip(
                    icon: Icons.favorite_border_rounded,
                    count: likes,
                    onTap: onLikeTap,
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    icon: Icons.chat_bubble_outline_rounded,
                    count: comments,
                    onTap: onCommentTap,
                  ),
                  const SizedBox(width: 8),
                  _StatChip(icon: Icons.visibility_outlined, count: views),
                  const Spacer(),
                  _RoundIconButton(
                    icon: Icons.ios_share_rounded,
                    size: 34,
                    onTap: onShareTap,
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) => const ColoredBox(
    color: NewsCardWidget._chip,
    child: Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        color: NewsCardWidget._muted,
      ),
    ),
  );
}

class _SourceInitial extends StatelessWidget {
  const _SourceInitial({required this.sourceName});

  final String sourceName;

  @override
  Widget build(BuildContext context) => Container(
    width: 48,
    height: 48,
    color: NewsCardWidget._chip,
    alignment: Alignment.center,
    child: Text(
      sourceName.isEmpty ? '?' : sourceName[0],
      style: const TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.sourceName,
    this.sourceLogoUrl,
    required this.timeAgo,
    required this.isVerified,
    this.onMoreTap,
  });

  final String sourceName;
  final String? sourceLogoUrl;
  final String timeAgo;
  final bool isVerified;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: sourceLogoUrl == null
              ? _SourceInitial(sourceName: sourceName)
              : Image.network(
                  sourceLogoUrl!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) =>
                      _SourceInitial(sourceName: sourceName),
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      sourceName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: NewsCardWidget._ink,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (isVerified) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: Color(0xFF1D9BF0),
                    ),
                  ],
                ],
              ),
              Text(
                timeAgo,
                style: const TextStyle(
                  color: NewsCardWidget._muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        _RoundIconButton(
          icon: Icons.more_vert_rounded,
          size: 40,
          onTap: onMoreTap,
          bordered: true,
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.count, this.onTap});

  final IconData icon;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NewsCardWidget._chip,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 15, color: NewsCardWidget._ink),
              const SizedBox(width: 5),
              Text(
                '$count',
                style: const TextStyle(
                  color: NewsCardWidget._ink,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.size,
    this.onTap,
    this.bordered = false,
  });

  final IconData icon;
  final double size;
  final VoidCallback? onTap;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bordered ? Colors.white : NewsCardWidget._chip,
      shape: CircleBorder(
        side: bordered
            ? const BorderSide(color: Color(0xFFE6E9E7))
            : BorderSide.none,
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: size * 0.45, color: NewsCardWidget._ink),
        ),
      ),
    );
  }
}
