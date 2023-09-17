import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_convert_from_do_net/di_injection/di_injection.dart';
import 'package:note_convert_from_do_net/presentation/views/note_list_page/note_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Note App',
        home: NoteListPage(),
      ),
    ),
  );
}
