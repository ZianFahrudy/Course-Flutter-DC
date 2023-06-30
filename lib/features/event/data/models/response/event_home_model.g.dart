// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventHomeModel _$EventHomeModelFromJson(Map<String, dynamic> json) =>
    EventHomeModel(
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
