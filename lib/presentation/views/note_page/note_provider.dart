import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_convert_from_do_net/di_injection/di_injection.dart';
import 'package:note_convert_from_do_net/presentation/controllers/note_controller.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_state.dart';

final noteProvider = StateNotifierProvider<NoteController, NoteState>(
  (ref) => getIt<NoteController>(),
);
