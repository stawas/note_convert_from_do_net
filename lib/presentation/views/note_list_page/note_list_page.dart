import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_convert_from_do_net/domain/entities/note.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_provider.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_state.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_page.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_provider.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_state.dart';

class NoteListPage extends ConsumerStatefulWidget {
  const NoteListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NoteListPage();
  }
}

class _NoteListPage extends ConsumerState<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    NoteListState noteListState = ref.watch(noteListProvider);
    ref.listen(noteProvider, (previous, next) {
      switch (next.runtimeType) {
        case NoteSaved:
        case NoteDeleted:
          ref.invalidate(noteListProvider);
          break;
        default:
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note list page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  NotePage.route(
                    isNew: true,
                    filename: '',
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: noteListState.noteList.length,
          itemBuilder: ((context, index) {
            Note note = noteListState.noteList[index];
            return ListTile(
              onTap: () => Navigator.push(context,
                  NotePage.route(isNew: false, filename: note.filename)),
              title: Text(note.filename),
              subtitle: Column(children: [
                Text(note.text),
                Text(note.date!.toIso8601String()),
              ]),
            );
          }),
        ),
      ),
    );
  }
}
