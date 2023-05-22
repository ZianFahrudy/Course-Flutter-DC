// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final String message;
  final int code;
  const MetaEntity({
    required this.message,
    required this.code,
  });
  @override
  List<Object> get props => [message, code];
}
