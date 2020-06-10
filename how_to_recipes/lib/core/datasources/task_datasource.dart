import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/core/services/Database/database.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:sqflite/sqflite.dart';

abstract class CategoryDataSource {
  Future<void> addCategory(Category category);
  Future<List<Category>> getCategory();
  Future<void> updateCategory(Category step);
  Future<void> deleteCategory(Category step);
  Future<int> getLastId();
}

class CategoryDataSourceImpl extends CategoryDataSource {
  final _db = locator<DatabaseH>();
  @override
  Future<void> addCategory(Category category) async {
    // Get a reference to the database.
    final db = await _db.database;

    // Insert the Task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same Task is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'category',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(category.toString());
  }

  @override
  Future<void> deleteCategory(Category category) async {
    // Get a reference to the database.
    final db = await _db.database;
    // Remove the Task from the Database.
    await db.delete(
      'category',
      // Use a `where` clause to delete a specific Task.
      where: "id = ?",
      // Pass the Step's id as a whereArg to prevent SQL injection.
      whereArgs: [category.id],
    );
  }

  @override
  Future<List<Category>> getCategory() async {
    // Get a reference to the database.
    final db = await _db.database;
    // Query the table for all The Categories.
    final List<Map<String, dynamic>> maps = await db.query('category');

    // Convert the List<Map<String, dynamic> into a List<Categories>.
    return List.generate(maps.length, (i) {
      return Category(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          imagePath: maps[i]['imagePath'],
          createdAt: maps[i]['createdAt']);
    });
  }

  @override
  Future<void> updateCategory(Category category) async {
    // Get a reference to the database.
    final db = await _db.database;
    // Update the given Category.
    await db.update(
      'category',
      category.toMap(),
      // Ensure that the Category has a matching id.
      where: "id = ?",
      // Pass the Category's id as a whereArg to prevent SQL injection.
      whereArgs: [category.id],
    );
  }

  @override
  Future<int> getLastId() async {
    // Get a reference to the database.
    final  db = await _db.database;
     // Query the table for all The Tasks.
    final List<Map<String, dynamic>> maps = await db
        .query('category');

    // Convert the List<Map<String, dynamic> into a List<Step>.
    return maps.length;
  }
}
