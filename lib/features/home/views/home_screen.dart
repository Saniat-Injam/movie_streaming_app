import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/colors.dart';
import 'package:movie_streaming_app/core/utils/constants/icon_path.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';
import 'package:movie_streaming_app/features/home/views/top_chart_screen.dart';
import 'package:movie_streaming_app/features/home/views/widgets/actor_card.dart';
import 'package:movie_streaming_app/features/home/views/widgets/movie_card.dart';
import 'package:movie_streaming_app/features/home/views/widgets/weekly_highlight.dart';
import 'package:movie_streaming_app/features/movie_details/views/movie_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Featured Movie
              Obx(() {
                final movie = homeController.featuredMovie.value;
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      movie.posterUrl,
                      fit: BoxFit.cover,
                      height: 400,
                      width: double.infinity,
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${movie.rating}  ${movie.year}  ${movie.duration}  ${movie.genre}",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(() => MovieDetailsScreen());
                                  },
                                  icon: SvgPicture.asset(IconPath.play),
                                  label: const Text("Watch Movie"),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(IconPath.watchlist),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),

              // Weekly Highlight
              WeeklyHighlight(),
              const SizedBox(height: 20),

              // Top Charts
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Charts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Text("View All", style: TextStyle(color: Colors.blue)),
                    GestureDetector(
                      onTap: () => Get.to(() => TopChartsScreen()),
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Obx(() {
                return SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.topCharts.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: homeController.topCharts[index]);
                    },
                  ),
                );
              }),

              // Popular Stars
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Popular Stars",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("View All", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Obx(() {
                return SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.popularStars.length,
                    itemBuilder: (context, index) {
                      final star = homeController.popularStars[index];
                      return ActorCard(
                        name: star["name"]!,
                        imageUrl: star["image"]!,
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.blackPrimary,
        selectedItemColor: AppColors.bluePrimary,
        unselectedItemColor: AppColors.greyPrimary,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconPath.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconPath.watchlist),
            label: "Watchlist",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconPath.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconPath.profile),
            label: "Accounts",
          ),
        ],
      ),
    );
  }
}
