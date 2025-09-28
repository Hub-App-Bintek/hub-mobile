// This file defines the abstract interface for a SHARED domain repository.
// Repository interfaces in the domain layer define the contract for data operations
// related to domain entities, without specifying how the data is fetched or stored.

// import 'package:pkp_hub/core/network/api_result.dart'; // For return types
// import 'package:pkp_hub/domain/entities/shared_example_entity.dart';

// /// Abstract interface for operations related to SharedExampleEntity.
// /// Implementations of this interface will reside in the data layer.
// abstract class SharedExampleRepository {
//   /// Fetches shared example data based on an ID.
//   /// Returns an [ApiResult] containing either the [SharedExampleEntity] on success
//   /// or an [AppError] on failure.
//   Future<ApiResult<SharedExampleEntity>> getSharedExampleData(String id);

//   // Add other shared data operation contracts here, for example:
//   // Future<ApiResult<List<SharedExampleEntity>>> getAllSharedExamples();
//   // Future<ApiResult<void>> saveSharedExampleData(SharedExampleEntity entity);
// }

// This interface will be implemented by SharedExampleRepositoryImpl in the data layer.
