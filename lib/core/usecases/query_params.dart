/// Represents query parameters for a GET request.
/// Any implementation must convert itself into a `Map<String, String>`.
abstract class QueryParams {
  Map<String, String> toQuery();
}
