// This file defines the states that the DashboardBloc can emit.
// States represent the UI's current condition based on data and operations.

// For value equality of states
// import 'package:pkp_hub/features/example_dashboard_feature/domain/entities/dashboard_item_entity.dart';
// import 'package:pkp_hub/core/error_handling/app_error.dart'; // For structured error information

// /// Base class for all dashboard states.
// /// Using Equatable allows for easy comparison of state instances, useful for testing and BlocConsumer/BlocBuilder.
// abstract class DashboardState extends Equatable {
//   const DashboardState();

//   @override
//   List<Object?> get props => [];
// }

// /// Initial state of the dashboard, before any data is loaded.
// class DashboardInitial extends DashboardState {
//   const DashboardInitial();
// }

// /// State indicating that dashboard data is currently being loaded.
// class DashboardLoading extends DashboardState {
//   const DashboardLoading();
// }

// /// State representing that dashboard items have been successfully loaded.
// class DashboardLoaded extends DashboardState {
//   final List<DashboardItemEntity> items;
//   // final bool hasReachedMax; // Optional: for pagination

//   const DashboardLoaded({required this.items /*, this.hasReachedMax = false */});

//   @override
//   List<Object?> get props => [items /*, hasReachedMax */];

//   DashboardLoaded copyWith({
//     List<DashboardItemEntity>? items,
//     // bool? hasReachedMax,
//   }) {
//     return DashboardLoaded(
//       items: items ?? this.items,
//       // hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//     );
//   }
// }

// /// State indicating an error occurred while fetching or processing dashboard data.
// class DashboardError extends DashboardState {
//   final AppError error; // Use the structured AppError type

//   const DashboardError(this.error);

//   @override
//   List<Object?> get props => [error];

//   String get userFriendlyMessage => error.userFriendlyMessage;
// }

// // You might add other states as needed, for example:
// // class DashboardEmpty extends DashboardState {
// //   const DashboardEmpty();
// // }

// // class DashboardRefreshing extends DashboardState { // Similar to DashboardLoading but for refresh scenarios
// //   final List<DashboardItemEntity> currentItems; // To show existing items while refreshing
// //   const DashboardRefreshing(this.currentItems);
// //   @override
// //   List<Object?> get props => [currentItems];
// // }
