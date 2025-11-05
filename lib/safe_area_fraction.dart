library safe_area_fraction;

import 'package:flutter/widgets.dart';

/// A widget that applies padding or margin based on a fraction of the safe area
/// and screen dimensions.
///
/// Example:
/// ```dart
/// SafeFraction(
///   heightFraction: 0.1,
///   widthFraction: 0.8,
///   child: Container(color: Colors.blue),
/// )
/// ```
///
///
class SafeFraction extends StatelessWidget {
  final double? heightFraction;
  final double? widthFraction;
  final EdgeInsets? extraPadding;
  final Widget child;

  const SafeFraction({
    super.key,
    this.heightFraction,
    this.widthFraction,
    this.extraPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final safeHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    final safeWidth =
        media.size.width - media.padding.left - media.padding.right;

    final padding = EdgeInsets.symmetric(
      vertical: (heightFraction ?? 0) * safeHeight,
      horizontal: (widthFraction ?? 0) * safeWidth,
    );

    return Padding(
      padding: padding + (extraPadding ?? EdgeInsets.zero),
      child: child,
    );
  }
}

/// Extension methods for context-based fractional safe paddings.
extension SafeAreaFractionContext on BuildContext {
  /// Returns a vertical safe padding fraction of total height.
  double safeHeightFraction(double fraction) {
    final media = MediaQuery.of(this);
    final safeHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    return safeHeight * fraction;
  }

  /// Returns a horizontal safe padding fraction of total width.

  double safeWidthFraction(double fraction) {
    final media = MediaQuery.of(this);
    final safeWidth =
        media.size.width - media.padding.left - media.padding.right;
    return safeWidth * fraction;
  }
}
