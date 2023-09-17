import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/use_case/load_all_note_use_case.dart';
import 'package:note_convert_from_do_net/domain/use_case/use_case.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_state.dart';

@injectable
class NoteListController extends StateNotifier<NoteListState> {
  final LoadAllNoteUseCase _loadAllNoteUseCase;

  NoteListController({
    required LoadAllNoteUseCase loadAllNoteUseCase,
  })  : _loadAllNoteUseCase = loadAllNoteUseCase,
        super(NoteListInitial()) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    state = NoteListLoading(
      noteList: state.noteList,
    );
    List<Note> noteList = await _loadAllNoteUseCase.execute(NoParams());
    state = NoteListLoaded(
      noteList: noteList,
    );
  }
}
