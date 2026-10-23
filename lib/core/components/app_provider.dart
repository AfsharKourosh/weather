import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/page-nav/cubit/page_nav_cubit.dart';
import 'package:weather/features/bookmark/presentation/book_mark_screen.dart';
import 'package:weather/features/weather/presentation/screens/curent_weather_screen.dart';
import 'package:weather/features/weather/presentation/widgets/footer_screens.dart';
import 'package:weather/features/weather/presentation/widgets/weather_widgets.dart';

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

    return BlocProvider(
      create: (context) => PageNavCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            // appBar: CustomAppBar(),
            bottomNavigationBar: FooterScreens(pageController: _pageController),
            extendBody: true,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: WeatherWidgets.getBackGroundImage(),
                  fit: BoxFit.cover,
                ),
              ),
              child: PageView.builder(
                onPageChanged: (index) =>
                    context.read<PageNavCubit>().changeIndex(index),
                controller: _pageController,
                itemBuilder: (context, index) => pages[index],
                itemCount: pages.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
