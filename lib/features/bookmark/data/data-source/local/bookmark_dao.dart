import 'package:floor/floor.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

@dao
abstract class BookmarkDao {
  @Query('SELECT * FROM BookmarkEntity')
  Future<List<BookmarkEntity>> getAllBookmarkEntity();

  @Query('SELECT * FROM BookmarkEntity WHERE name = :name')
  Future<BookmarkEntity?> findBookmarkEntityByName(String name);

  @insert
  Future<void> insertBookmarkEntity(BookmarkEntity person);

  @Query('DELETE FROM BookmarkEntity WHERE name = :name')
  Future<void> deleteBookmarkEntityByName(String name);
}
