import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/util/note_order.dart';

sealed class NotesEvent<T> {
  factory NotesEvent.loadNotes() = LoadNotes;
  factory NotesEvent.deleteNote(Note note) = DeleteNote;
  factory NotesEvent.restoreNote() = RestoreNote;
  factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;
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

class ChangeOrder<T> implements NotesEvent<T> {
  final NoteOrder noteOrder;
  ChangeOrder(this.noteOrder);
}