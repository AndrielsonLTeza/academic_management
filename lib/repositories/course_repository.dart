import 'package:sqflite/sqflite.dart';
import '../database/app_database.dart';
import '../models/course.dart';

class CourseRepository {
  final AppDatabase _appDatabase = AppDatabase();

  Future<int> inserir(Course course) async {
    final db = await _appDatabase.database;
    return await db.insert(
      'courses',
      course.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Course>> listar() async {
    final db = await _appDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('courses');

    return List.generate(maps.length, (i) {
      return Course.fromMap(maps[i]);
    });
  }

  Future<int> atualizar(Course course) async {
    final db = await _appDatabase.database;
    return await db.update(
      'courses',
      course.toMap(),
      where: 'courseId = ?',
      whereArgs: [course.courseId],
    );
  }

  Future<int> remover(int id) async {
    final db = await _appDatabase.database;
    return await db.delete('courses', where: 'courseId = ?', whereArgs: [id]);
  }
}
