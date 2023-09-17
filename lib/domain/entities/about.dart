import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about.freezed.dart';

@freezed
class About with _$About {
  const factory About(
      {required String title,
      required String version,
      required String moreInfoUrl,
      required String message}) = _About;
}
