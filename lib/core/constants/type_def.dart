import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/model/userModel.dart';

typedef FutureEither<T>= Future<Either<Failure,T>>;
typedef FutureVoid= FutureEither<void>;