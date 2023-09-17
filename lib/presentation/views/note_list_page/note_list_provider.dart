import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_convert_from_do_net/di_injection/di_injection.dart';
import 'package:note_convert_from_do_net/presentation/controllers/note_list_controller.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_state.dart';

final noteListProvider = StateNotifierProvider<NoteListController, NoteListState>(
  (ref) => getIt<NoteListController>(),
);
