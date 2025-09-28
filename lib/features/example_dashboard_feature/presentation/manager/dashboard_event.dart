// This file defines the events that can be dispatched to the DashboardBloc.
// Events trigger state changes or side effects within the Bloc.

// For value equality of events

// /// Base class for all dashboard events.
// /// Using Equatable allows for easy comparison of event instances, useful for testing and bloc logic.
// abstract class DashboardEvent extends Equatable {
//   const DashboardEvent();

//   @override
//   List<Object?> get props => [];
// }

// /// Event dispatched to fetch the initial dashboard items.
// class FetchDashboardItems extends DashboardEvent {
//   const FetchDashboardItems();
// }

// /// Event dispatched to refresh the dashboard items.
// class RefreshDashboardItems extends DashboardEvent {
//   const RefreshDashboardItems();
// }

// // Add other dashboard-specific events as needed, for example:
// // class DashboardItemTapped extends DashboardEvent {
// //   final String itemId;
// //   const DashboardItemTapped(this.itemId);
// //   @override
// //   List<Object?> get props => [itemId];
// // }

// // class FilterDashboardItems extends DashboardEvent {
// //   final String filterQuery;
// //   const FilterDashboardItems(this.filterQuery);
// //   @override
// //   List<Object?> get props => [filterQuery];
// // }
