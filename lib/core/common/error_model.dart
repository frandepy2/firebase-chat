

import 'package:freezed_annotation/freezed_annotation.dart';

part  'error_model.freezed.dart';
part  'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    required String message,
    required String code,
    required DateTime timestamp,
  }) = _ErrorModel;

  /// Método para serialización JSON
  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}
