// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:event_app/common/error/failure.dart';
import 'package:event_app/features/auth/data/models/request/login_body.dart';
import 'package:event_app/features/auth/data/models/request/register_body.dart';
import 'package:event_app/features/auth/domain/entities/login_entity.dart';

import '../entities/register_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginBody body);
  Future<Either<Failure, RegisterEntity>> register(RegisterBody body);
}
