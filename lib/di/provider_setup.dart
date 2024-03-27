import 'package:note_app/data/data_source/note_db_hepler.dart';
import 'package:note_app/data/repository/note_repository_impl.dart';
import 'package:note_app/domain/respository/note_repository.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:note_app/presentation/notes/notes_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Future<List<SingleChildWidget>> getProviders() async{
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT,'
              'color INTEGER, timestamp INTEGER)');
    }
  );

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository noteRepository = NoteRepositoryImpl(noteDbHelper);
  NotesViewModel notesViewModel = NotesViewModel(noteRepository);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(noteRepository);
 
  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel)
  ];
}