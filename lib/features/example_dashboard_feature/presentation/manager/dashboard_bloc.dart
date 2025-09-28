// This file contains the DashboardBloc, responsible for managing the state of the dashboard feature.
// It interacts with use cases from the domain layer to fetch and process data.

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/manager/dashboard_event.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/manager/dashboard_state.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/domain/usecases/get_dashboard_items_usecase.dart';
// import 'package:pkp_hub/core/usecases/usecase.dart'; // For NoParams
// import 'package:pkp_hub/core/network/api_result.dart';
// import 'package:pkp_hub/core/error_handling/app_error.dart';

// /// BLoC for managing the state of the example dashboard feature.
// class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
//   final GetDashboardItemsUseCase _getDashboardItemsUseCase;
//   // Add other use cases as dependencies if needed, e.g., for refresh, filtering, etc.

//   DashboardBloc({required GetDashboardItemsUseCase getDashboardItemsUseCase}) 
//       : _getDashboardItemsUseCase = getDashboardItemsUseCase,
//         super(const DashboardInitial()) {
//     on<FetchDashboardItems>(_onFetchDashboardItems);
//     on<RefreshDashboardItems>(_onRefreshDashboardItems);
//     // Register other event handlers here
//   }

//   Future<void> _onFetchDashboardItems(
//     FetchDashboardItems event,
//     Emitter<DashboardState> emit,
//   ) async {
//     emit(const DashboardLoading());
//     await _fetchItems(emit);
//   }

//   Future<void> _onRefreshDashboardItems(
//     RefreshDashboardItems event,
//     Emitter<DashboardState> emit,
//   ) async {
//     // Optionally, emit a DashboardRefreshing state if you want to show old data while loading new
//     // if (state is DashboardLoaded) {
//     //   emit(DashboardRefreshing((state as DashboardLoaded).items));
//     // } else {
//     //   emit(const DashboardLoading());
//     // }
//     emit(const DashboardLoading()); // Simpler: just show loading for refresh
//     await _fetchItems(emit);
//   }

//   Future<void> _fetchItems(Emitter<DashboardState> emit) async {
//     final result = await _getDashboardItemsUseCase(const NoParams());

//     result.when(
//       success: (items) {
//         if (items.isEmpty) {
//           // emit(const DashboardEmpty()); // If you have a specific empty state
//           emit(const DashboardLoaded(items: [])); // Or loaded with empty list
//         } else {
//           emit(DashboardLoaded(items: items));
//         }
//       },
//       failure: (AppError error) {
//         // Log the error using a proper logger, ensuring no sensitive data is logged.
//         // logger.e('Failed to fetch dashboard items', error: error, stackTrace: error.originalException as StackTrace?);
//         emit(DashboardError(error));
//       },
//     );
//   }

//   // Add handlers for other events like item taps, filters, etc.
//   // Example:
//   // Future<void> _onDashboardItemTapped(
//   //   DashboardItemTapped event,
//   //   Emitter<DashboardState> emit,
//   // ) async {
//   //   // Handle navigation or other actions based on item tap
//   //   // This might involve calling another use case or interacting with a navigation service.
//   //   print('Item tapped: ${event.itemId}');
//   // }
// }

// This BLoC would typically be provided to the widget tree using BlocProvider in the feature's page/screen.
// // BlocProvider(
// //   create: (context) => DashboardBloc(
// //     getDashboardItemsUseCase: getIt<GetDashboardItemsUseCase>(), // Assuming DI with get_it
// //   )..add(const FetchDashboardItems()), // Initial event to load data
// //   child: YourDashboardPageWidget(),
// // )
