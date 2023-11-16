import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import '../../models/artcile.dart';
import 'DAO/article_dao.dart';

part 'app_database.g.dart';


@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase{

  ArticleDao get articleDAO;

}