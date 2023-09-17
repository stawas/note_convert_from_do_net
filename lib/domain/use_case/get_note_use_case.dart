import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/repositories/note_repository.dart';
import 'package:note_convert_from_do_net/domain/use_case/use_case.dart';

@injectable
class GetNoteUseCase implements UseCase<String, Future<Note>> {
  final NoteRepository noteRepo;

  GetNoteUseCase({
    required this.noteRepo,
  });

  @override
  Future<Note> execute(String filename) async {
    Note? note = await noteRepo.getNote(filename);
    if (note == null) throw Exception('File note exists');
    return note;
  }
}
