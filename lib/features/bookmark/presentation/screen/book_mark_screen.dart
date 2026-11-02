import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/bookmark_bloc.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/delete_bookmark_status.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/get_all_bookmark_status.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key, this.pageController});

  final PageController? pageController;

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BookmarkBloc>().add(GetAllBookmarkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkBloc, BookmarkState>(
      buildWhen: (previous, current) {
        return previous.getAllBookmarkStatus != current.getAllBookmarkStatus;
      },
      listenWhen: (previous, current) {
        return previous.deleteBookmarkStatus != current.deleteBookmarkStatus;
      },
      listener: (context, state) {
        switch (state.deleteBookmarkStatus) {
          case DeleteBookmarkCompleted():
            context.read<BookmarkBloc>().add(GetAllBookmarkEvent());

          case DeleteBookmarkError(:final message):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message ?? 'Failed to delete bookmark'),
                behavior: SnackBarBehavior.floating,
              ),
            );

          default:
            break;
        }
      },
      builder: (context, state) {
        final width = MediaQuery.of(context).size.width;

        switch (state.getAllBookmarkStatus) {
          case GetAllBookmarkLoading():
            return const Center(child: CircularProgressIndicator());

          case GetAllBookmarkCompleted(:final bookmarks):
            if (bookmarks.isEmpty) {
              return const SafeArea(
                child: Column(
                  children: [
                    Text(
                      'WatchList',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'There are no bookmarked cities',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return SafeArea(
              child: Column(
                children: [
                  const Text(
                    'WatchList',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bookmarks.length,
                      itemBuilder: (context, index) {
                        final bookmark = bookmarks[index];

                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                width: width,
                                height: 60,
                                color: Colors.grey.withValues(alpha: 0.1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          context.read<WeatherBloc>().add(
                                            GetCurentWeather(
                                              WeatherReqModel(
                                                cityName: bookmark.name,
                                                measure: 'metric',
                                              ),
                                            ),
                                          );

                                          widget.pageController!.animateToPage(
                                            0,
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              bookmark.name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<BookmarkBloc>().add(
                                          DeleteBookmarkEvent(bookmark.name),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

          case GetAllBookmarkError(:final message):
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message ?? 'Failed to load bookmarks',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BookmarkBloc>().add(GetAllBookmarkEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
