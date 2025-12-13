import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/query_params.dart';

/// A base use case for GET requests that accept query parameters.
/// If no query is provided, defaults to an empty map.
abstract class UseCaseQueryParams<T, Params extends QueryParams> {
  Future<Result<T, Failure>> call(Params queryParams);
}
