// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:event_app/common/models/meta_entity.dart';
import 'package:event_app/features/event/domain/entities/event_entity.dart';

class EventHomeEntity extends Equatable {
  final MetaEntity meta;
  final List<EventEntity> data;
  const EventHomeEntity({
    required this.meta,
    required this.data,
  });
  @override
  List<Object> get props => [meta, data];
}
