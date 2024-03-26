import 'package:note_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDb {
  Database db;

  NoteDb(this.db);

  Future<Note?> getNoteById(int id) async {
    final List<Map<String, dynamic>> maps = await db.query('note', // table 이름
        where: 'id = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query('note');
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> insertNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db.update('note', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id]
    );
  }
}
