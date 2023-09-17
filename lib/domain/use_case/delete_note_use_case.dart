import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/repositories/note_repository.dart';
import 'package:note_convert_from_do_net/domain/use_case/use_case.dart';

@injectable
class DeleteNoteUseCase implements UseCase<Note, Future<void>> {
  final NoteRepository noteRepo;

  DeleteNoteUseCase({
    required this.noteRepo,
  });

  @override
  Future<void> execute(Note note) async {
    return noteRepo.delete(note);
  }
}
