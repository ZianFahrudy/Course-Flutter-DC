// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:event_app/common/models/meta_entity.dart';

class LoginEntity extends Equatable {
  final MetaEntity meta;
  final DataLoginEntity? data;
  const LoginEntity({
    required this.meta,
    required this.data,
  });

  @override
  List<Object> get props => [meta, data!];
}

class DataLoginEntity extends Equatable {
  final String token;
  const DataLoginEntity({
    required this.token,
  });
  @override
  List<Object> get props => [token];
}
