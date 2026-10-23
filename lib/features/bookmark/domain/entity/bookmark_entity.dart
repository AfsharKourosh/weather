import 'package:floor/floor.dart';

@entity
class BookmarkEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  BookmarkEntity({required this.name});
}