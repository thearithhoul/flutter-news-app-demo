import 'package:flutter/material.dart';

/// Loads an image from a web [url], with a loading indicator and a fallback
/// icon when the url is missing or fails to load.
class ImageUrlWidget extends StatelessWidget {
  const ImageUrlWidget({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String? url;
  final BoxFit fit;
  final double? width;
  final double? height;

  static const _background = Color(0xFFEFF1F0);
  static const _muted = Color(0xFF7A807C);

  @override
  Widget build(BuildContext context) {
    final url = this.url;
    if (url == null || url.isEmpty) return _placeholder();

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        final total = progress.expectedTotalBytes;
        return SizedBox(
          width: width,
          height: height,
          child: ColoredBox(
            color: _background,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                value: total == null
                    ? null
                    : progress.cumulativeBytesLoaded / total,
              ),
            ),
          ),
        );
      },
      errorBuilder: (_, _, _) => _placeholder(),
    );
  }

  Widget _placeholder() => SizedBox(
    width: width,
    height: height,
    child: const ColoredBox(
      color: _background,
      child: Center(
        child: Icon(Icons.image_not_supported_outlined, color: _muted),
      ),
    ),
  );
}
