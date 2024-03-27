import 'package:flutter/foundation.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_notes_use_case.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/presentation/notes/note_state.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  // final NoteRepository repository;

  final GetNotesUseCase getNotes;
  final DeleteNoteUseCase deleteNote;
  final AddNoteUseCase addNote;

  NoteState _state = NoteState();
  NoteState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.getNotes, this.deleteNote, this.addNote) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await getNotes();

    _state = state.copyWith(notes: notes);

    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await deleteNote(note);
    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if(_recentlyDeletedNote != null) {
      await addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes();
    }
  }
}
