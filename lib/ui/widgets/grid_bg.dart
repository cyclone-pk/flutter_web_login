import 'package:flutter/material.dart';
import 'package:flutter_web_login_screen/ui/widgets/hover_sqare.dart';

class GridBackground extends StatelessWidget {
  const GridBackground({super.key});

  @override
  Widget build(BuildContext context) {
    const double squareSize = 60.0;
    const double gap = 6.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final int columns = (width / (squareSize + gap)).floor();
        final int rows = (height / (squareSize + gap)).floor();
        final int itemCount = columns * rows;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(6),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: gap,
            mainAxisSpacing: gap,
            childAspectRatio: 1.0,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return const HoverSquare();
          },
        );
      },
    );
  }
}
