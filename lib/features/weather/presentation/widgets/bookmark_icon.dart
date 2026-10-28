import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/bookmark_bloc.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/get_bookmark_status.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/save_bookmark_status.dart';

class BookMarkIcon extends StatefulWidget {
  final String name;

  const BookMarkIcon({super.key, required this.name});

  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {
  @override
  void initState() {
    super.initState();

    context.read<BookmarkBloc>().add(GetBookmarkByNameEvent(widget.name));
  }

  @override
  void didUpdateWidget(covariant BookMarkIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.name != widget.name) {
      final bloc = context.read<BookmarkBloc>();

      bloc.add(SaveBookmarkInitialEvent());
      bloc.add(GetBookmarkByNameEvent(widget.name));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<BookmarkBloc, BookmarkState>(
      buildWhen: (previous, current) {
        return previous.getBookmarkStatus != current.getBookmarkStatus ||
            previous.saveBookmarkStatus != current.saveBookmarkStatus;
      },
      listenWhen: (previous, current) {
        return previous.saveBookmarkStatus != current.saveBookmarkStatus;
      },
      listener: (context, state) {
        switch (state.saveBookmarkStatus) {
          case SaveBookmarkError(:final message):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message ?? 'Bookmark operation failed'),
                behavior: SnackBarBehavior.floating,
              ),
            );

          case SaveBookmarkCompleted(:final bookmarkEntity):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${bookmarkEntity.name} bookmark updated'),
                behavior: SnackBarBehavior.floating,
              ),
            );

          default:
            break;
        }
      },
      builder: (context, state) {
        switch (state.getBookmarkStatus) {
          case GetBookmarkLoading():
            return const CircularProgressIndicator();

          case GetBookmarkBookmarkError():
            return IconButton(
              onPressed: () {
                context.read<BookmarkBloc>().add(
                  GetBookmarkByNameEvent(widget.name),
                );
              },
              icon: const Icon(Icons.error, color: Colors.white, size: 35),
              tooltip: 'Retry',
            );

          case GetBookmarkCompleted(:final bookmarkEntity):
            if (state.saveBookmarkStatus case SaveBookmarkLoading()) {
              return const CircularProgressIndicator();
            }

            return IconButton(
              onPressed: () {
                final bloc = context.read<BookmarkBloc>();

                if (bookmarkEntity == null) {
                  bloc.add(SaveCwEvent(widget.name));
                } else {
                  bloc.add(DeleteBookmarkEvent(widget.name));
                }
              },
              icon: Icon(
                bookmarkEntity == null ? Icons.star_border : Icons.star,
                color: Colors.white,
                size: height * 0.04,
              ),
            );
        }
      },
    );
  }
}

// class BookMarkIcon extends StatelessWidget {
//   final String name;

//   const BookMarkIcon({super.key, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     // final width = MediaQuery.of(context).size.width;

//     return BlocBuilder<BookmarkBloc, BookmarkState>(
//       buildWhen: (previous, current) {
//         if (current.getBookmarkStatus == previous.getBookmarkStatus) {
//           return false;
//         }
//         return true;
//       },
//       builder: (context, state) {
//         context.read<BookmarkBloc>().add(SaveBookmarkInitialEvent());

//         if (state.getBookmarkStatus is GetBookmarkLoading) {
//           return const CircularProgressIndicator();
//         }

//         if (state.getBookmarkStatus case GetBookmarkCompleted(
//           :final bookmarkEntity,
//         )) {
//           return BlocConsumer<BookmarkBloc, BookmarkState>(
//             listenWhen: (previous, current) {
//               if (current.saveBookmarkStatus == previous.saveBookmarkStatus) {
//                 return false;
//               }
//               return true;
//             },
//             buildWhen: (previous, current) {
//               if (current.saveBookmarkStatus == previous.saveBookmarkStatus) {
//                 return false;
//               }
//               return true;
//             },
//             listener: (context, cityState) {
//               if (cityState.saveBookmarkStatus case SaveBookmarkError(
//                 :final message,
//               )) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(message!),
//                     behavior: SnackBarBehavior.floating, // Add this line
//                   ),
//                 );
//               }

//               if (cityState.saveBookmarkStatus case SaveBookmarkCompleted(
//                 :final bookmarkEntity,
//               )) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("${bookmarkEntity.name} Added to Bookmark"),
//                     behavior: SnackBarBehavior.floating, // Add this line
//                   ),
//                 );
//               }
//             },
//             builder: (context, cityState) {
//               if (cityState.saveBookmarkStatus is SaveBookmarkInitial) {
//                 return IconButton(
//                   onPressed: () {
//                     context.read<BookmarkBloc>().add(SaveCwEvent(name));
//                   },
//                   icon: Icon(
//                     bookmarkEntity == null ? Icons.star_border : Icons.star,
//                     color: Colors.white,
//                     size: height * 0.04,
//                   ),
//                 );
//               }

//               if (cityState.saveBookmarkStatus is SaveBookmarkLoading) {
//                 return const CircularProgressIndicator();
//               }

//               return IconButton(
//                 onPressed: () {
//                   BlocProvider.of<BookmarkBloc>(context).add(SaveCwEvent(name));
//                 },
//                 icon: const Icon(Icons.star, color: Colors.white, size: 35),
//               );
//             },
//           );
//         }

//         if (state.getBookmarkStatus is GetBookmarkBookmarkError) {
//           return IconButton(
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("please load a city!"),
//                   behavior: SnackBarBehavior.floating, // Add this line
//                 ),
//               );
//             },
//             icon: const Icon(Icons.error, color: Colors.white, size: 35),
//           );
//         }

//         /// default value
//         return Container();
//       },
//     );
//   }
// }
