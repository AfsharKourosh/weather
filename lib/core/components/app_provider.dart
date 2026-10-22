import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/page-nav/cubit/page_nav_cubit.dart';
import 'package:weather/features/weather/presentation/screens/book_mark_screen.dart';
import 'package:weather/features/weather/presentation/screens/curent_weather_screen.dart';

class AppProvider extends StatefulWidget {
  const AppProvider({super.key});
  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [CurentWeatherScreen(), BookMarkScreen()];

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

    return BlocProvider(
      create: (context) => PageNavCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(),
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) => pages[index],
                itemCount: pages.length,
              ),
            ),
            bottomNavigationBar: BlocBuilder<PageNavCubit, int>(
              builder: (context, currentIndex) {
                return BottomNavigationBar(
                  items: navigationBarItem,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    context.read<PageNavCubit>().changeIndex(index);
                    _pageController.jumpToPage(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
