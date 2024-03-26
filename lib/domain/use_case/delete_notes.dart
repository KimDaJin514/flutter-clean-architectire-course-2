import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/respository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;
  DeleteNote(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}