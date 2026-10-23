import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather/config/theme/app_colors.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/page-nav/cubit/page_nav_cubit.dart';

class FooterScreens extends StatelessWidget {
  const FooterScreens({super.key, required this._pageController});

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> navigationBarItem = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        activeIcon: Icon(Icons.home_filled),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: 'bookMark',
        activeIcon: Icon(Icons.bookmark_add_outlined),
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 30,
      children: [
        SmoothPageIndicator(
          controller: _pageController,
          count: 2,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            spacing: 5,
            activeDotColor: Colors.white,
          ),
          onDotClicked: (index) => _pageController.animateToPage(
            index,
            duration: const Duration(microseconds: 500),
            curve: Curves.bounceOut,
          ),
        ),
        BlocBuilder<PageNavCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              elevation: 0,
              unselectedFontSize: 14,
              iconSize: 34,
              showSelectedLabels: false,
              items: navigationBarItem,
              unselectedItemColor: AppColors.primary,
              backgroundColor: Colors.transparent,
              selectedItemColor: AppColors.onPrimary,
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<PageNavCubit>().changeIndex(index);
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
