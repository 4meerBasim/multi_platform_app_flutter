import 'package:flutter/material.dart';
import 'package:liquid_glass/liquid_glass.dart';

class FrostedMoreButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Icon? icon;
  final double? size;
  final Color? iconColor;
  const FrostedMoreButton({
    super.key,
    this.onTap,
    this.icon,
    this.iconColor,
    this.size,
  });

  @override
  State<FrostedMoreButton> createState() => _FrostedMoreButtonState();
}

class _FrostedMoreButtonState extends State<FrostedMoreButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 1.2);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: LiquidGlass(
            blur: 1.0,
            opacity: 0.09,
            tint: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconTheme(
                data: IconThemeData(
                  color: Colors.white,
                  size: widget.size ?? 22,
                ),
                child: widget.icon ?? const Icon(Icons.more_vert),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
