import 'dart:io';

import 'package:note_convert_from_do_net/data/data_source/note_data_source.dart';
import 'package:note_convert_from_do_net/data/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NoteDataSource)
class NoteLocalDatasourceImpl implements NoteDataSource {
  @override
  Future<void> delete(NoteModel note) async {
    try {
      final file = await getLocalFile(note.filename);
      final fileExists = await file.exists();
      await file.delete();
    } on FileSystemException {}
  }

  @override
  Future<NoteModel?> getNote(String filename) async {
    try {
      final file = await getLocalFile(filename);
      final contents = await file.readAsString();
      final fileStat = await FileStat.stat(file.path);
      final fileModifiedTime =
          fileStat.modified.millisecondsSinceEpoch.toString();
      return NoteModel(
          filename: filename, text: contents, date: fileModifiedTime);
    } on FileSystemException {
      return null;
    }
  }

  @override
  Future<List<NoteModel>> loadAllNotes() async {
    final path = await getPath();
    final directory = Directory('$path/notes/');
    final List<NoteModel> notes = [];
    try {
      final List<FileSystemEntity> entities = await directory.list().toList();
      final Iterable<File> files = entities.whereType<File>();

      for (var file in files) {
        final String name = basename(file.path);
        final String contents = await file.readAsString();
        final fileStat = await FileStat.stat(file.path);
        final fileModifiedTime =
            fileStat.modified.millisecondsSinceEpoch.toString();
        notes.add(
            NoteModel(filename: name, text: contents, date: fileModifiedTime));
      }
    } on PathNotFoundException {
      return notes;
    }

    return notes;
  }

  @override
  Future<void> saveNote(NoteModel note) async {
    File file = await getLocalFile(note.filename);
    await file.writeAsString(note.text);
  }

  @override
  Future<void> addNote(NoteModel note) async {
    final file = await getNewLocalFile(note.filename);
    await file.writeAsString(note.text);
  }

  Future<String> getPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getLocalFile(String filename) async {
    final path = await getPath();
    return File('$path/notes/$filename').create(recursive: true);
  }

  Future<File> getNewLocalFile(String filename) async {
    final path = await getPath();
    return File('$path/notes/$filename.notes.txt').create(recursive: true);
  }
}
