import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'details.dart';



class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();


  Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();

    return _database;
  }

  initDB() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'notas.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
         db.execute(
          'CREATE TABLE notas(id INTEGER PRIMARY KEY autoincrement, char TEXT, nota TEXT)',
        );

      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  // Define a function that inserts dogs into the database
  insertNota(Notas nota) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'notas',
      nota.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  // A method that retrieves all the dogs from the dogs table.
 Future<List<Notas>> todasNotas() async {
   // Get a reference to the database.
   final db = await database;
   //insertNota(new Notas(id:1, char: "Sol Badguy", nota:"UNGA BUNGA"));

   // Query the table for all The Dogs.

   final List<Map<String, dynamic>> maps = await db.rawQuery(
       'SELECT * FROM notas');

   // Convert the List<Map<String, dynamic> into a List<Dog>.
   return List.generate(maps.length, (i) {
     return Notas(
       id: maps[i]['id'],
       char: maps[i]['char'],
       nota: maps[i]['nota'],
     );
   });
 }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Notas>> charNotas(String char) async {
    // Get a reference to the database.
    final db = await database;
    //insertNota(new Notas(id:1, char: "Sol Badguy", nota:"UNGA BUNGA"));

    // Query the table for all The Dogs.

    final List<Map<String, dynamic>> maps = await db.query('notas',
      // Use a `where` clause to delete a specific dog.
      where: 'char = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [char],
    );



    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Notas(
        id: maps[i]['id'],
        char: maps[i]['char'],
        nota: maps[i]['nota'],
      );
    });
  }


  updateNota(Notas nota) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'notas',
      nota.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [nota.id],
    );
  }

  deleteNota(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'notas',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


}


