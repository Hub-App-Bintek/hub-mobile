// This file defines the abstract interface for the dashboard feature's repository.
// It dictates the contract for data operations related to dashboard entities,
// ensuring the domain layer is independent of data source specifics.

// import 'package:pkp_hub/core/network/api_result.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/domain/entities/dashboard_item_entity.dart';

// /// Abstract interface for data operations related to the Dashboard feature.
// /// Implementations of this interface will reside in the feature's data layer.
// abstract class DashboardRepository {
//   /// Fetches a list of dashboard items for the feature.
//   /// Returns an [ApiResult] containing either a list of [DashboardItemEntity] on success
//   /// or an [AppError] on failure.
//   Future<ApiResult<List<DashboardItemEntity>>> getDashboardItems();

//   // Add other dashboard-specific data operation contracts here, for example:
//   // Future<ApiResult<DashboardSummaryEntity>> getDashboardSummary();
//   // Future<ApiResult<void>> updateDashboardItem(DashboardItemEntity item);
// }

// This interface will be implemented by DashboardRepositoryImpl in the feature's data layer.
