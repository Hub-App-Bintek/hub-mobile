import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/query_params.dart';

/// Base use case that needs both query params and a body.
abstract class UseCaseQueryAndBody<T, Params extends QueryParams, Payload> {
  Future<Result<T, Failure>> call({
    required Params queryParams,
    required Payload payload,
  });
}
