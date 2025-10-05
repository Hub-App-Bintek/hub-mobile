import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';

abstract class UseCase<T, Params> {
  Future<Result<T, Failure>> call(Params params);
}
