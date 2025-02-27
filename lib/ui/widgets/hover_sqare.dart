import 'package:flutter/material.dart';
import 'package:flutter_web_login_screen/style/color.dart';

class HoverSquare extends StatefulWidget {
  const HoverSquare({super.key});

  @override
  State<HoverSquare> createState() => _HoverSquareState();
}

class _HoverSquareState extends State<HoverSquare> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: _isHovered
              ? CustomTheme.accentColor
              : CustomTheme.white.withValues(alpha: .1),
        ),
      ),
    );
  }
}
