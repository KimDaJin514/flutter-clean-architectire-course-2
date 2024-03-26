import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';

class AddNote {
  final NoteRepository repository;
  AddNote(this.repository);

  Future<void> call(Note note) async{
    await repository.insertNote(note);
  }
}