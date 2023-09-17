import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/domain/use_case/delete_note_use_case.dart';
import 'package:note_convert_from_do_net/domain/use_case/get_note_use_case.dart';
import 'package:note_convert_from_do_net/domain/use_case/save_note_use_case.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_state.dart';

@injectable
class NoteController extends StateNotifier<NoteState> {
  final SaveNoteUseCase _saveNoteUseCase;
  final GetNoteUseCase _getNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  NoteController({
    required SaveNoteUseCase saveNoteUseCase,
    required GetNoteUseCase getNoteUseCase,
    required DeleteNoteUseCase deleteNoteUseCase,
  })  : _saveNoteUseCase = saveNoteUseCase,
        _getNoteUseCase = getNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase,
        super(NoteInitial());

  void onNoteContentChanged(String content) {
    Note note = state.note.copyWith(text: content);
    state = NoteInitial(note: note, isValid: contentIsValid(note.text));
  }

  void getNote(String filename) async {
    state = NoteLoading(note: state.note, isValid: contentIsValid(state.note.text));
    Note note = await _getNoteUseCase.execute(filename);
    state = NoteLoaded(note: note, isValid: contentIsValid(note.text));
  }

  void onSaved(bool isNew) async {
    SaveNoteRequest requestNote =
        SaveNoteRequest(isNew: isNew, note: state.note);
    state = NoteLoading(note: state.note, isValid: state.isValid);
    await _saveNoteUseCase.execute(requestNote);
    state = NoteSaved();
  }

  void onDeleted() async {
    Note note = state.note;
    state = NoteLoading(note: note);
    await _deleteNoteUseCase.execute(note);
    state = NoteDeleted();
  }

  bool contentIsValid(String? content) {
    if (content == null) return false;
    if (content.isEmpty) return false;
    return true;
  }
}
