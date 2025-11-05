import 'package:flutter/widgets.dart';

/// A widget that applies safe area–aware padding based on a fraction
/// of the usable screen dimensions.
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
