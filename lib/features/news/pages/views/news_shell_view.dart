import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_custom_mobile_app/features/news/pages/providers/nav_bar_provider.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/nev_bar_widget.dart';
import 'package:news_custom_mobile_app/features/news/pages/shared/news_page_scaffold.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/explore_view.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/favourite_view.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/home_view.dart';
import 'package:news_custom_mobile_app/features/news/pages/views/profile_view.dart';

const _tabs = <Widget>[
  HomeViews(),
  ExploreView(),
  FavouriteView(),
  ProfileView(),
];

/// Hosts the four news tabs behind the shared background and nav bar.
class NewsShellView extends StatelessWidget {
  const NewsShellView({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = navBarPaths
        .indexOf(location)
        .clamp(0, navBarPaths.length - 1);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: newsBackgroundGradient),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: KeyedSubtree(
                    key: ValueKey(index),
                    child: _tabs[index],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: NavBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
