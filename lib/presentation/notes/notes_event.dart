import 'package:note_app/domain/model/note.dart';

sealed class NotesEvent<T> {
  factory NotesEvent.loadNotes() = LoadNotes;
  factory NotesEvent.deleteNote(Note note) = DeleteNote;
  factory NotesEvent.restoreNote() = RestoreNote;
}

class LoadNotes<T> implements NotesEvent<T> {
  LoadNotes();
}

class DeleteNote<T> implements NotesEvent<T> {
  final Note note;
  DeleteNote(this.note);
}

class RestoreNote<T> implements NotesEvent<T> {
  RestoreNote();
}