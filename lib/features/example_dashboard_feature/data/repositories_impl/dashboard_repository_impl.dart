// This file contains the concrete implementation of the DashboardRepository interface for the dashboard feature.
// It uses feature-specific data sources (remote and local) to manage dashboard data.

// import 'package:pkp_hub/core/network/api_result.dart';
// import 'package:pkp_hub/core/error_handling/app_error.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/data/datasources/remote/dashboard_remote_data_source.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/data/datasources/local/dashboard_local_data_source.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/domain/entities/dashboard_item_entity.dart'; // Feature-specific domain entity
// import 'package:pkp_hub/features/example_dashboard_feature/data/models/dashboard_item_model.dart'; // Feature-specific data model
// import 'package:pkp_hub/features/example_dashboard_feature/domain/repositories/dashboard_repository.dart'; // Feature-specific repository interface

// /// Concrete implementation of the DashboardRepository for the example dashboard feature.
// /// This class orchestrates data flow between remote and local data sources for dashboard items,
// /// handles caching, and maps data models to domain entities.
// class DashboardRepositoryImpl implements DashboardRepository {
//   final DashboardRemoteDataSource _remoteDataSource;
//   final DashboardLocalDataSource _localDataSource;
//   // final NetworkInfo _networkInfo; // Optional: for checking network connectivity

//   DashboardRepositoryImpl({
//     required DashboardRemoteDataSource remoteDataSource,
//     required DashboardLocalDataSource localDataSource,
//     // required NetworkInfo networkInfo,
//   })  : _remoteDataSource = remoteDataSource,
//         _localDataSource = localDataSource;
//         // _networkInfo = networkInfo;

//   @override
//   Future<ApiResult<List<DashboardItemEntity>>> getDashboardItems() async {
//     // Example of an offline-first strategy:
//     // 1. Try to fetch from local cache.
//     // 2. If local data is available and not stale, return it.
//     // 3. If network is available, fetch from remote.
//     // 4. If remote fetch is successful, update cache and return data.
//     // 5. If remote fetch fails but cached data exists, return cached (potentially stale) data with a warning.
//     // 6. If no data and remote fails, return error.

//     try {
//       // Try local cache first
//       final List<DashboardItemModel>? cachedItems = await _localDataSource.getCachedDashboardItems();
//       if (cachedItems != null && cachedItems.isNotEmpty) {
//         // Map List<DashboardItemModel> to List<DashboardItemEntity>
//         // final entities = cachedItems.map((model) => model.toDomainEntity()).toList(); // Assuming a mapper
//         final entities = cachedItems.map((model) => DashboardItemEntity(id: model.itemId, title: model.title, imageUrl: model.imageUrl)).toList(); // Placeholder mapping
//         // Optionally, trigger a background sync if data is stale but still usable
//         return Success(entities);
//       }

//       // // If network is not available and no cache, return appropriate error or empty state
//       // if (!await _networkInfo.isConnected) {
//       //   return Failure(NetworkError(message: 'No internet connection and no cached data.'));
//       // }

//       // Fetch from remote
//       final remoteResult = await _remoteDataSource.getDashboardItems();

//       return remoteResult.when(
//         success: (List<DashboardItemModel> models) async {
//           await _localDataSource.cacheDashboardItems(models); // Update cache
//           // Map List<DashboardItemModel> to List<DashboardItemEntity>
//           // final entities = models.map((model) => model.toDomainEntity()).toList();
//           final entities = models.map((model) => DashboardItemEntity(id: model.itemId, title: model.title, imageUrl: model.imageUrl)).toList(); // Placeholder mapping
//           return Success(entities);
//         },
//         failure: (AppError error) {
//           // Log error securely
//           // print('Error fetching dashboard items from remote: $error');
//           return Failure(error);
//         },
//       );
//     } catch (e) {
//       // Log error securely
//       // print('Unexpected error in DashboardRepositoryImpl: $e');
//       return Failure(UnexpectedError(message: e.toString(), originalException: e));
//     }
//   }

//   // Implement other methods defined in the DashboardRepository interface
// }

// This repository implementation would typically be registered in a feature-specific DI scope,
// or within the main service_locator.dart if features are not large enough for their own scopes.
// // getIt.registerLazySingleton<DashboardRepository>(
// //   () => DashboardRepositoryImpl(
// //     remoteDataSource: getIt<DashboardRemoteDataSource>(),
// //     localDataSource: getIt<DashboardLocalDataSource>(),
// //     // networkInfo: getIt<NetworkInfo>(),
// //   ),
// // );
