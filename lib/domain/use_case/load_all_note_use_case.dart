import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/repositories/note_repository.dart';
import 'package:note_convert_from_do_net/domain/use_case/use_case.dart';

@injectable
class LoadAllNoteUseCase implements UseCase<NoParams, Future<List<Note>>> {
  final NoteRepository noteRepo;

  LoadAllNoteUseCase({
    required this.noteRepo,
  });

  @override
  Future<List<Note>> execute(NoParams params) async {
    return noteRepo.loadAllNotes();
  }
}
