import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart' as uuid;

part 'note.freezed.dart';

@freezed
class Note with _$Note {

  const Note._();

  const factory Note({
    @Default('') String filename,
    @Default('') String text,
    @Default(null) DateTime? date,
  }) = _Note;

  static String getRandomName() {
    return const uuid.Uuid().v4();
  }
}
