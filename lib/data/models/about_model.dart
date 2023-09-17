import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_model.freezed.dart';

part 'about_model.g.dart';

@freezed
class AboutModel with _$AboutModel {
  const factory AboutModel(
      {required String title,
      required String version,
      required String moreInfoUrl,
      required String message}) = _AboutModel;

  factory AboutModel.fromJson(Map<String, Object?> json) =>
      _$AboutModelFromJson(json);
}
