// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:event_app/common/models/meta_entity.dart';
import 'package:event_app/features/information/domain/entities/information_entity.dart';

class InformationResponseEntity extends Equatable {
  final MetaEntity meta;
  final List<InformationEntity> data;
  const InformationResponseEntity({
    required this.meta,
    required this.data,
  });
  @override
  List<Object> get props => [meta, data];
}
