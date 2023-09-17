// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/local/note_local_data_source_impl.dart' as _i4;
import '../data/data_source/note_data_source.dart' as _i3;
import '../data/repositories/note_repository_impl.dart' as _i6;
import '../domain/repositories/note_repository.dart' as _i5;
import '../domain/use_case/delete_note_use_case.dart' as _i8;
import '../domain/use_case/get_note_use_case.dart' as _i9;
import '../domain/use_case/load_all_note_use_case.dart' as _i10;
import '../domain/use_case/save_note_use_case.dart' as _i7;
import '../presentation/controllers/note_controller.dart' as _i11;
import '../presentation/controllers/note_list_controller.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NoteDataSource>(() => _i4.NoteLocalDatasourceImpl());
    gh.factory<_i5.NoteRepository>(
        () => _i6.NoteRepositoryImpl(noteDataSource: gh<_i3.NoteDataSource>()));
    gh.factory<_i7.SaveNoteUseCase>(
        () => _i7.SaveNoteUseCase(noteRepo: gh<_i5.NoteRepository>()));
    gh.factory<_i8.DeleteNoteUseCase>(
        () => _i8.DeleteNoteUseCase(noteRepo: gh<_i5.NoteRepository>()));
    gh.factory<_i9.GetNoteUseCase>(
        () => _i9.GetNoteUseCase(noteRepo: gh<_i5.NoteRepository>()));
    gh.factory<_i10.LoadAllNoteUseCase>(
        () => _i10.LoadAllNoteUseCase(noteRepo: gh<_i5.NoteRepository>()));
    gh.factory<_i11.NoteController>(() => _i11.NoteController(
          saveNoteUseCase: gh<_i7.SaveNoteUseCase>(),
          getNoteUseCase: gh<_i9.GetNoteUseCase>(),
          deleteNoteUseCase: gh<_i8.DeleteNoteUseCase>(),
        ));
    gh.factory<_i12.NoteListController>(() => _i12.NoteListController(
        loadAllNoteUseCase: gh<_i10.LoadAllNoteUseCase>()));
    return this;
  }
}
