import 'package:flutter/foundation.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_notes_use_case.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';
import 'package:note_app/presentation/notes/note_state.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NoteState _state = NoteState(
    order: NoteOrder.date(
      OrderType.descending(),
    ),
  );

  NoteState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.useCases) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    switch (event) {
      case LoadNotes():
        _loadNotes();
      case DeleteNote():
        _deleteNote(event.note);
      case RestoreNote():
        _restoreNote();
      case ChangeOrder():
        _changeOrder(event.noteOrder);
    }
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.order);

    _state = state.copyWith(notes: notes);

    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      await _loadNotes();
    }
  }

  Future<void> _changeOrder(NoteOrder order) async {
    _state = state.copyWith(order: order);

    await _loadNotes();
  }
}
