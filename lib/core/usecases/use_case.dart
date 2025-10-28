import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';

/// Base use case that requires a parameter.
abstract class UseCase<T, Params> {
  Future<Result<T, Failure>> call(Params params);
}

/// Base use case without any parameter.
abstract class UseCaseNoParams<T> {
  Future<Result<T, Failure>> call();
}

/// Represents query parameters for a GET request.
/// Any implementation must convert itself into a `Map<String, String>`.
abstract class QueryParams {
  Map<String, String> toQuery();
}

/// A base use case for GET requests that accept query parameters.
/// If no query is provided, defaults to an empty map.
abstract class UseCaseQueryParams<T, Params extends QueryParams> {
  Future<Result<T, Failure>> call(Params queryParams);
}
