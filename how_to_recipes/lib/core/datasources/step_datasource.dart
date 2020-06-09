import 'package:how_to_recipes/core/models/step.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/core/services/Database/database.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:sqflite/sqflite.dart';

abstract class StepDataSource {
  Future<void> addSteps(Step step);
  Future<List<Step>> getsteps(Category category);
  Future<void> updateStep(Step step);
  Future<void> deleteStep(Step step);
}

class StepDataSourceImpl extends StepDataSource {
  final _db = locator<DatabaseH>();

  @override
  Future<void> addSteps(Step step) async {
    // Get a reference to the database.
    final Database db = await _db.database;

    // Insert the Task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same Task is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'step',
      step.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(step.toString());
  }

  @override
  Future<void> deleteStep(Step step) async {
    // Get a reference to the database.
    final Database db = await _db.database;
     // Remove the Task from the Database.
    await db.delete(
      'step',
      // Use a `where` clause to delete a specific Task.
      where: "id = ?",
      // Pass the Step's id as a whereArg to prevent SQL injection.
      whereArgs: [step.id],
    );
  }

  @override
  Future<List<Step>> getsteps(Category category) async {
    // Get a reference to the database.
    final Database db = await _db.database;
     // Query the table for all The Tasks.
    final List<Map<String, dynamic>> maps = await db
        .query('task', where: "categoryId = ?", whereArgs: [category.id], orderBy: 'stepNum');

    // Convert the List<Map<String, dynamic> into a List<Step>.
    return List.generate(maps.length, (i) {
      return Step(
          id: maps[i]['id'],
          description: maps[i]['name'],
          categoryId: maps[i]['categoryId'],
          step: maps[i]['stepNum']);
    });
  }

  @override
  Future<void> updateStep(Step step) async {
    // Get a reference to the database.
    final Database db = await _db.database;
    // Update the given Task.
    await db.update(
      'step',
      step.toMap(),
      // Ensure that the Task has a matching id.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [step.id],
    );
  }
}
