import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_custom_mobile_app/features/news/domain/dto/news_detail.dto.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/news_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/image_url_widget.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';

/// Full article screen (screen 3 of the design).
class NewsDetailView extends ConsumerStatefulWidget {
  const NewsDetailView({super.key, required this.id});
  final int id;
  @override
  ConsumerState<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends ConsumerState<NewsDetailView> {
  /// Extra height the sheet gains as the article content is scrolled.
  double _expandedHight = 0;

  int get id => widget.id;

  /// Header row height: 40 button + 8 padding top and bottom.
  static const _headerHeight = 60.0;

  late ScrollController _scrollContorller;

  @override
  void initState() {
    super.initState();
    _scrollContorller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollContorller.hasClients) return;
    final pos = _scrollContorller.position;

    final extra = pos.pixels < pos.minScrollExtent ? 0.0 : pos.pixels;
    if (extra != _expandedHight) {
      setState(() => _expandedHight = extra);
    }
  }

  @override
  void dispose() {
    _scrollContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final article = ref.watch(newsDetailProvider(id));

    return article.when(
      data: (news) => _buildArticle(context, news),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Article not found'),
              TextButton(
                onPressed: () => ref.invalidate(newsDetailProvider(id)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticle(BuildContext context, NewsDetailDto news) {
    final screen = MediaQuery.sizeOf(context);
    final imageHeight = screen.height * 0.42;
    final minHeight = screen.height - (imageHeight - 20);
    final maxHeight =
        screen.height - (MediaQuery.paddingOf(context).top + _headerHeight);
    final sheetHeight = (minHeight + _expandedHight).clamp(
      minHeight,
      maxHeight,
    );
    final progress = (sheetHeight - minHeight) / (maxHeight - minHeight);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: newsBackgroundGradient),
        child: Stack(
          children: [
            // Images
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 1 - progress,
                child: SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: ImageUrlWidget(url: news.imageUrl),
                ),
              ),
            ),

            // body
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 2,
                ),
                width: screen.width,
                height: sheetHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: _scrollContorller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          news.category ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        news.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            child: Text(
                              (news.sourceName ?? '?').characters.first,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              [
                                news.author,
                                news.sourceName,
                              ].whereType<String>().join(' · '),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        news.publishedAt ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _stat(Icons.favorite_border, news.likes),
                          const SizedBox(width: 20),
                          _stat(Icons.chat_bubble_outline, news.comments),
                          const SizedBox(width: 20),
                          _stat(Icons.visibility_outlined, news.views),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SafeArea(
                        top: false,
                        bottom: true,
                        child: Text(
                          news.body ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Header: back button, centered title, more button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    _headerButton(
                      Icons.arrow_back_ios_new,
                      () => Navigator.maybePop(context),
                    ),
                    Expanded(
                      // Title fades in as the image fades out.
                      child: Opacity(
                        opacity: progress,
                        child: Text(
                          news.sourceName ?? '',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    _headerButton(Icons.more_horiz, () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback onPressed) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    elevation: 1,
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    ),
  );

  Widget _stat(IconData icon, int value) => Row(
    children: [
      Icon(icon, size: 18, color: Colors.black),
      const SizedBox(width: 6),
      Text('$value', style: const TextStyle(color: Colors.black)),
    ],
  );
}
