import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/model/note.dart';

part 'note_state.freezed.dart';

part 'note_state.g.dart';


@freezed
class NoteState with _$NoteState {
  factory NoteState({
    @Default([]) List<Note> notes,
  }) = _NoteState;

  factory NoteState.fromJson(Map<String, dynamic> json) => _$NoteStateFromJson(json);
}
