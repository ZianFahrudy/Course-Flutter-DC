// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class InformationEntity extends Equatable {
  final String informationId;
  final String informationTitle;
  final String informationDescription;
  final String informationDate;
  const InformationEntity({
    required this.informationId,
    required this.informationTitle,
    required this.informationDescription,
    required this.informationDate,
  });

  @override
  List<Object> get props {
    return [
      informationId,
      informationTitle,
      informationDescription,
      informationDate,
    ];
  }
}
