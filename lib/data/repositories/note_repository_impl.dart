import 'dart:async';

import 'package:note_convert_from_do_net/data/data_source/note_data_source.dart';
import 'package:note_convert_from_do_net/data/models/note_model.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/repositories/note_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource noteDataSource;

  const NoteRepositoryImpl({
    required this.noteDataSource,
  });

  @override
  Future<void> delete(Note note) async {
    final NoteModel noteModel = NoteModel.fromEntity(note);
    await noteDataSource.delete(noteModel);
  }

  @override
  Future<Note?> getNote(String filename) async {
    NoteModel? noteModel = await noteDataSource.getNote(filename);
    if (noteModel == null) {
      return null;
    }
    return NoteModel.fromModel(noteModel);
  }

  @override
  Future<List<Note>> loadAllNotes() async {
    return NoteModel.fromListModel(await noteDataSource.loadAllNotes());
  }

  @override
  Future<void> saveNote(Note note) async {
    noteDataSource.saveNote(NoteModel.fromEntity(note));
  }

  @override
  Future<void> addNote(Note note) async {
    noteDataSource.addNote(NoteModel.fromEntity(note));
  }
  
}
