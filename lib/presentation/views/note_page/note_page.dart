import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_provider.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_provider.dart';
import 'package:note_convert_from_do_net/presentation/views/note_page/note_state.dart';

class NotePage extends ConsumerStatefulWidget {
  final bool isNew;
  final String filename;

  const NotePage({super.key, required this.isNew, required this.filename});

  static Route<void> route({required bool isNew, required String filename}) =>
      MaterialPageRoute(
          builder: (_) => NotePage(
                isNew: isNew,
                filename: filename,
              ));

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NotePage();
  }
}

class _NotePage extends ConsumerState<NotePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _contentTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.invalidate(noteProvider);
      if (widget.isNew == false) {
          ref.read(noteProvider.notifier).getNote(widget.filename);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    NoteState noteState = ref.watch<NoteState>(noteProvider);

    ref.listen(noteProvider, (previous, next) {
      String message = '';
      switch (next.runtimeType) {
        case NoteSaved:
          {
            Navigator.pop(context,'data');
            message = 'Note saved!';
          }
        case NoteDeleted:
          {
            Navigator.pop(context,'data');
            message = 'Note deleted!';
          }
        case NoteLoaded:
          {
            _contentTextEditingController.text = next.note.text;
            message = 'Note loaded!';
          }
        default:
          break;
      }
      if (message.isNotEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(noteState.note.text),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _contentTextEditingController,
                onChanged: (value) {
                  _formKey.currentState!.validate();
                  ref.read(noteProvider.notifier).onNoteContentChanged(value);
                },
                decoration: const InputDecoration(hintText: 'Enter note here'),
                validator: (value) {
                  bool isValid =
                      ref.read(noteProvider.notifier).contentIsValid(value);
                  if (isValid) {
                    return null;
                  }
                  return 'Note cannot blank';
                },
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: noteState.isValid
                      ? () {
                          ref.read(noteProvider.notifier).onSaved(widget.isNew);
                        }
                      : null,
                  child: const Text('Save'),
                ),
                OutlinedButton(
                  onPressed: noteState.isValid
                      ? () {
                          ref.read(noteProvider.notifier).onDeleted();
                        }
                      : null,
                  child: const Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
