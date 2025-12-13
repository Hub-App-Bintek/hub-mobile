import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';

/// Base use case without any parameter.
abstract class UseCaseNoPayload<T> {
  Future<Result<T, Failure>> call();
}
