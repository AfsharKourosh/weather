import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:weather/features/bookmark/data/data-source/local/bookmark_dao.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

part 'bookmark_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [BookmarkEntity])
abstract class AppDatabase extends FloorDatabase {
  BookmarkDao get bookmarkDao;
}
