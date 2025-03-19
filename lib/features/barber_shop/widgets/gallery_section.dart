import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/package_image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        childCount: 44,
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 2),
          QuiltedGridTile(2, 1),
          // QuiltedGridTile(1, 2),
          // QuiltedGridTile(1, 1),
          // QuiltedGridTile(1, 1),
        ],
      ),
    );
  }
}
