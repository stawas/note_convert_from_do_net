import 'package:note_convert_from_do_net/domain/entities/note.dart';

sealed class NoteListState {
  const NoteListState({this.noteList = const [],});
  final List<Note> noteList;
}

final class NoteListInitial extends NoteListState {
  NoteListInitial({
    List<Note> noteList = const [],
  }) : super(noteList: List.from(noteList),);
}

final class NoteListLoading extends NoteListState {
  NoteListLoading({
    List<Note> noteList = const [],
  }) : super(noteList: List.from(noteList),);
}

final class NoteListLoaded extends NoteListState {
  NoteListLoaded({
    List<Note> noteList = const [],
  }) : super(noteList: List.from(noteList),);
}
