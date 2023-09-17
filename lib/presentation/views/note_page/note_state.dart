import 'package:note_convert_from_do_net/domain/entities/note.dart';

sealed class NoteState {
  const NoteState({this.note = const Note(), this.isValid = false});
  final Note note;
  final bool isValid;
}

final class NoteInitial extends NoteState {
  NoteInitial({
    Note note = const Note(),
    bool isValid = false,
  }) : super(note: note.copyWith(), isValid: isValid);
}

final class NoteLoading extends NoteState {
  NoteLoading({
    Note note = const Note(),
    bool isValid = false,
  }) : super(note: note.copyWith(), isValid: isValid);
}

final class NoteLoaded extends NoteState {
  NoteLoaded({
    Note note = const Note(),
    bool isValid = false,
  }) : super(note: note.copyWith(), isValid: isValid);
}

final class NoteSaved extends NoteState {
  NoteSaved({
    Note note = const Note(),
    bool isValid = false,
  }) : super(note: note.copyWith(), isValid: isValid);
}

final class NoteDeleted extends NoteState {
  NoteDeleted({
    Note note = const Note(),
    bool isValid = false,
  }) : super(note: note.copyWith(), isValid: isValid);
}
