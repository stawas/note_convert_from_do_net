import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/repositories/note_repository.dart';
import 'package:note_convert_from_do_net/domain/use_case/use_case.dart';

@injectable
class SaveNoteUseCase implements UseCase<SaveNoteRequest, Future<String>> {
  final NoteRepository noteRepo;

  SaveNoteUseCase({
    required this.noteRepo,
  });

  @override
  Future<String> execute(SaveNoteRequest noteRequest) async {
    String filename = '';
    Note? note = await noteRepo.getNote(noteRequest.note.filename);
    if (note == null) {
      filename = Note.getRandomName();
      await noteRepo.addNote(
          noteRequest.note.copyWith(filename: filename, date: DateTime.now()));
    } else {
      filename = noteRequest.note.filename;
      await noteRepo.saveNote(noteRequest.note);
    }
    return filename;
  }
}

class SaveNoteRequest {
  final bool isNew;
  final Note note;

  const SaveNoteRequest({
    required this.isNew,
    required this.note,
  });
}
