// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'search_event_body.g.dart';

@JsonSerializable(createFactory: false)
class SearchEventBody {
  final String keyword;
  SearchEventBody({
    required this.keyword,
  });

  Map<String, dynamic> toJson() => _$SearchEventBodyToJson(this);
}
