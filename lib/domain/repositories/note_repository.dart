import 'package:note_convert_from_do_net/domain/entities/note.dart';

enum NoteEvent { noEvent, needUpdate }

abstract class NoteRepository {
  Future<List<Note>> loadAllNotes();
  Future<Note?> getNote(String filename);
  Future<void> saveNote(Note note);
  Future<void> addNote(Note note);
  Future<void> delete(Note note);
}
