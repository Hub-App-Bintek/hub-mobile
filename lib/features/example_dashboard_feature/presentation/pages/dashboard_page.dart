// This file contains the UI for the Dashboard feature's main page.
// It will use BlocBuilder/BlocConsumer to react to states from DashboardBloc.

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/manager/dashboard_bloc.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/manager/dashboard_event.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/manager/dashboard_state.dart';
// import 'package:pkp_hub/features/example_dashboard_feature/presentation/widgets/dashboard_item_widget.dart'; // Feature-specific widget
// import 'package:pkp_hub/app/widgets/common_button.dart'; // Shared widget example
// import 'package:pkp_hub/app/di/service_locator.dart'; // For DI if constructing Bloc here or for dependencies

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // If Bloc is not provided higher up the tree specifically for this route,
//     // you might provide it here. Otherwise, you can directly use BlocProvider.of<DashboardBloc>(context).
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'), // Localize this text
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               // context.read<DashboardBloc>().add(const RefreshDashboardItems());
//             },
//             tooltip: 'Refresh', // Localize this text
//           ),
//         ],
//       ),
//       body: BlocProvider<DashboardBloc>(
//         create: (context) => DashboardBloc(
//           // getDashboardItemsUseCase: getIt<GetDashboardItemsUseCase>(), // Assuming DI for use case
//         )..add(const FetchDashboardItems()), // Initial event to load data
//         child: BlocConsumer<DashboardBloc, DashboardState>(
//           listener: (context, state) {
//             // Handle side effects like showing SnackBars for errors, navigation, etc.
//             if (state is DashboardError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.userFriendlyMessage)), // Localize error messages
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is DashboardInitial || state is DashboardLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state is DashboardLoaded) {
//               if (state.items.isEmpty) {
//                 return const Center(child: Text('No dashboard items found.')); // Localize this text
//               }
//               // Use a ListView, GridView, or other appropriate widget for displaying items
//               return ListView.builder(
//                 itemCount: state.items.length,
//                 itemBuilder: (context, index) {
//                   final item = state.items[index];
//                   // return DashboardItemWidget(item: item); // Your custom widget for an item
//                   return ListTile(title: Text(item.title), subtitle: Text(item.id));
//                 },
//               );
//             }
//             if (state is DashboardError) {
//               // Optionally, show a more specific error UI in the body
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Failed to load dashboard: ${state.userFriendlyMessage}'), // Localize
//                     const SizedBox(height: 16),
//                     CommonButton(
//                       onPressed: () => context.read<DashboardBloc>().add(const FetchDashboardItems()),
//                       text: 'Retry', // Localize
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return const Center(child: Text('Unhandled dashboard state.')); // Should not happen ideally
//           },
//         ),
//       ),
//     );
//   }
// }
