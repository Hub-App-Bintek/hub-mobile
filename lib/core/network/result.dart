/// A sealed class representing the result of an operation, which can either
/// be a success or an error.
sealed class Result<S, E> {
  const Result();
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Error<S, E> extends Result<S, E> {
  const Error(this.error);
  final E error;
}
