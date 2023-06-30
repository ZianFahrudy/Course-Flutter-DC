// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InformationResponseModel _$InformationResponseModelFromJson(
  Map<String, dynamic> json,
) =>
    InformationResponseModel(
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => InformationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
