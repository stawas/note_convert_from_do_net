import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';

part 'note_model.freezed.dart';

part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const NoteModel._();

  const factory NoteModel({
    required String filename,
    required String text,
    required String date,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, Object?> json) =>
      _$NoteModelFromJson(json);

  static Note fromModel(NoteModel model) {
    return Note(
        filename: model.filename,
        text: model.text,
        date: toDateTime(model.date));
  }

  static List<Note> fromListModel(List<NoteModel> notesModel) {
    List<Note> notes = [];
    for (var note in notesModel) {
      notes.add(
        Note(
          filename: note.filename,
          text: note.text,
          date: NoteModel.toDateTime(note.date),
        ),
      );
    }
    return notes;
  }

  static NoteModel fromEntity(Note entity) {
    return NoteModel(
        filename: entity.filename,
        text: entity.text,
        date: toTimestamp(entity.date));
  }

  static DateTime toDateTime(String timstamp) {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(timstamp));
  }

  static String toTimestamp(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch.toString() ?? '';
  }
}
