// ignore_for_file: public_member_api_docs

import 'package:fpdart/fpdart.dart';
import 'package:greenleaf/features/common/domain/failures/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = Future<Either<Failure, void>>;
typedef FutureVoid = Future<void>;
