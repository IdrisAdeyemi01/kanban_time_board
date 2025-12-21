import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';

mixin UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParams {}
