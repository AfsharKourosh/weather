import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/page-nav/cubit/page_nav_cubit.dart';

class FooterScreens extends StatelessWidget {
  const new({
    super.key,
    required this._pageController,
    required this.navigationBarItem,
  });

  final PageController _pageController;
  final List<BottomNavigationBarItem> navigationBarItem;

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: navigationBarItem,
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
