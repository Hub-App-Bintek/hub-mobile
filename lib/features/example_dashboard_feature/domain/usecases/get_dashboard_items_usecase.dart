// This file defines a feature-specific use case for fetching dashboard items.
// It uses the base UseCase class and interacts with the feature's repository interface.

// import 'package:pkp_hub/core/network/api_result.dart';
// import 'package:pkp_hub/core/usecases/usecase.dart'; // The base UseCase class
// import 'package:pkp_hub/features/example_dashboard_feature/domain/entities/dashboard_item_entity.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/domain/repositories/dashboard_repository.dart';

// /// Use case for fetching a list of dashboard items specific to this feature.
// /// It depends on the abstract [DashboardRepository] to retrieve data.
// class GetDashboardItemsUseCase implements UseCase<List<DashboardItemEntity>, NoParams> {
//   final DashboardRepository _repository;

//   GetDashboardItemsUseCase(this._repository);

//   @override
//   Future<ApiResult<List<DashboardItemEntity>>> call(NoParams params) async {
//     // Business logic specific to fetching dashboard items can be added here.
//     // For example, filtering, sorting based on some user preference (if applicable),
//     // or combining with other data if the use case was more complex.

//     // For this simple case, we directly call the repository method.
//     return await _repository.getDashboardItems();
//   }
// }

// // If the use case required parameters, you would define a specific Params class:
// // class GetDashboardItemsByFilterUseCaseParams {
// //   final String filterCriteria;
// //   const GetDashboardItemsByFilterUseCaseParams({required this.filterCriteria});
// // }

// // class GetDashboardItemsByFilterUseCase implements UseCase<List<DashboardItemEntity>, GetDashboardItemsByFilterUseCaseParams> {
// //   final DashboardRepository _repository;
// //   GetDashboardItemsByFilterUseCase(this._repository);
// //   @override
// //   Future<ApiResult<List<DashboardItemEntity>>> call(GetDashboardItemsByFilterUseCaseParams params) async {
// //     return await _repository.getDashboardItems(filter: params.filterCriteria); // Assuming repository supports filter
// //   }
// // }

// This use case would typically be instantiated and used by the feature's state manager
// (e.g., a Bloc or Cubit for the dashboard).
