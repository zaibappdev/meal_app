import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    this.onTap,
  });

  final String title;
  final String imageUrl;
  final int duration;
  final String complexity;
  final String affordability;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Card(
      margin: EdgeInsets.all(screenSize.width * 0.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            // 🖼 Image with Hero removed (no model id dependency)
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              height: screenSize.height * 0.25,
              width: double.infinity,
            ),

            // 🔲 Bottom Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.08,
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),

                    // ℹ Info Row
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            label: '$duration min',
                          ),
                          SizedBox(width: screenSize.width * 0.03),
                          MealItemTrait(icon: Icons.work, label: complexity),
                          SizedBox(width: screenSize.width * 0.03),
                          MealItemTrait(
                            icon: Icons.attach_money,
                            label: affordability,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
