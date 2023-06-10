import 'package:equatable/equatable.dart';
import 'package:event_app/common/models/meta_entity.dart';

class RegisterEntity extends Equatable {
  const RegisterEntity({
    required this.meta,
  });
  final MetaEntity meta;

  @override
  List<Object> get props => [meta];
}
