import 'package:flutter/widgets.dart';

/// Extension on [BuildContext] to quickly access safe area aware fractions.
extension SafeAreaFractionContext on BuildContext {
  /// Returns a vertical fraction of the usable screen height
  /// (excluding top/bottom safe areas).
  double safeHeightFraction(double fraction) {
    final media = MediaQuery.of(this);
    final safeHeight =
        media.size.height - media.padding.top - media.padding.bottom;
    return safeHeight * fraction;
  }

  /// Returns a horizontal fraction of the usable screen width
  /// (excluding left/right safe areas).
  double safeWidthFraction(double fraction) {
    final media = MediaQuery.of(this);
    final safeWidth =
        media.size.width - media.padding.left - media.padding.right;
    return safeWidth * fraction;
  }
}
