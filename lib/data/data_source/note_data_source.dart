import 'package:note_convert_from_do_net/data/models/note_model.dart';

abstract class NoteDataSource {
  Future<List<NoteModel>> loadAllNotes();
  Future<NoteModel?> getNote(String id);
  Future<void> saveNote(NoteModel note);
  Future<void> addNote(NoteModel note);
  Future<void> delete(NoteModel note);
}
