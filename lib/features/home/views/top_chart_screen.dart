// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movie_streaming_app/features/home/controllers/top_chart_controller.dart';
// import 'package:movie_streaming_app/features/home/views/widgets/top_chart_card.dart';

// class TopChartsScreen extends StatelessWidget {
//   final TopChartsController controller = Get.put(TopChartsController());

//   TopChartsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // AppBar Row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Get.back(),
//                     child: const Icon(Icons.arrow_back, color: Colors.white),
//                   ),
//                   const Text(
//                     "Top Charts",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text(
//                     "Skip",
//                     style: TextStyle(color: Colors.white70, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Movies Grid
//             Expanded(
//               child: Obx(() {
//                 final movies = controller.topCharts;
//                 return GridView.builder(
//                   padding: const EdgeInsets.all(16),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8,
//                     childAspectRatio: 0.65,
//                   ),
//                   itemCount: movies.length,
//                   itemBuilder: (context, index) {
//                     return TopChartCard(movie: movies[index]);
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/home/controllers/top_chart_controller.dart';
import 'package:movie_streaming_app/features/home/views/widgets/top_chart_card.dart';

class TopChartsScreen extends StatelessWidget {
  final TopChartsController controller = Get.put(TopChartsController());

  TopChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Increase item height → larger grid cards
    final itemHeight =
        (screenHeight - kToolbarHeight - 60) / 1.8; // instead of /2
    final itemWidth = screenWidth / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text(
                    "Top Charts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Movies Grid
            Expanded(
              child: Obx(() {
                final movies = controller.topCharts;
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: itemWidth / itemHeight,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return TopChartCard(movie: movies[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
