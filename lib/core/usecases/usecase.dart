import 'package:pkp_hub/core/network/api_result.dart'; // Or your custom Result/Either type

// This file defines a generic base class or interface for use cases (interactors)
// in the domain layer, promoting consistency as per Clean Architecture.

/// Abstract class representing a use case or interactor.
///
/// [Type] represents the return type of the use case (often wrapped in an ApiResult).
/// [Params] represents the parameters required by the use case.
/// Use `NoParams` if a use case does not require any parameters.
abstract class UseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

/// A utility class to represent that a use case does not require any parameters.
class NoParams {
  const NoParams();
}

// Example of how a specific use case might implement this (conceptual):
// // In features/some_feature/domain/usecases/get_some_data_usecase.dart
// // import 'package:pkp_hub/core/usecases/usecase.dart';
// // import 'package:pkp_hub/core/network/api_result.dart';
// // import 'package:pkp_hub/features/some_feature/domain/repositories/some_feature_repository.dart';
// // import 'package:pkp_hub/features/some_feature/domain/entities/some_data_entity.dart';

// // class GetSomeDataUseCase implements UseCase<SomeDataEntity, String> {
// //   final SomeFeatureRepository repository;

// //   GetSomeDataUseCase(this.repository);

// //   @override
// //   Future<ApiResult<SomeDataEntity>> call(String id) async {
// //     // Business logic here, e.g., validation
// //     return await repository.getSomeData(id);
// //   }
// // }

// // Example for a use case with no parameters:
// // class GetAllItemsUseCase implements UseCase<List<ItemEntity>, NoParams> {
// //   final ItemRepository repository;

// //   GetAllItemsUseCase(this.repository);

// //   @override
// //   Future<ApiResult<List<ItemEntity>>> call(NoParams params) async {
// //     return await repository.getAllItems();
// //   }
// // }
