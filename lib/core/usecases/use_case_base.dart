import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';

/// Base use case that requires a payload.
abstract class UseCase<T, Payload> {
  Future<Result<T, Failure>> call(Payload payload);
}
