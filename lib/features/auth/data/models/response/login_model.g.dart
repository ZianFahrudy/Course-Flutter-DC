// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
    );

DataLoginModel _$DataLoginModelFromJson(Map<String, dynamic> json) =>
    DataLoginModel(
      token: json['token'] as String,
    );
