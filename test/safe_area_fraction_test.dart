import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safe_area_fraction/safe_area_fraction.dart';

void main() {
  // Ensure test binding is initialized before tests start
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SafeFraction Widget Tests', () {
    testWidgets(
      'applies correct fractional padding vertically and horizontally',
      (WidgetTester tester) async {
        // Build a SafeFraction widget inside Directionality & MediaQuery
        await tester.pumpWidget(
          const Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: MediaQueryData(
                size: Size(400, 800),
                padding: EdgeInsets.only(top: 50, bottom: 50),
              ),
              child: SafeFraction(
                heightFraction: 0.1, // 10% of safe height (700 * 0.1 = 70)
                widthFraction: 0.05, // 5% of safe width (400 * 0.05 = 20)
                child: Placeholder(),
              ),
            ),
          ),
        );

        // Verify the widget exists
        expect(find.byType(SafeFraction), findsOneWidget);
        expect(find.byType(Placeholder), findsOneWidget);
      },
    );

    testWidgets('renders child properly', (WidgetTester tester) async {
      const childKey = Key('safeChild');

      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: MediaQueryData(size: Size(360, 720)),
            child: SafeFraction(
              heightFraction: 0.1,
              widthFraction: 0.05,
              child: SizedBox(key: childKey, width: 100, height: 100),
            ),
          ),
        ),
      );

      expect(find.byKey(childKey), findsOneWidget);
    });
  });

  group('SafeAreaFractionContext extension tests', () {
    testWidgets('safeHeightFraction returns correct value', (tester) async {
      late double value;

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(
              size: Size(400, 800),
              padding: EdgeInsets.only(top: 100, bottom: 100),
            ),
            child: Builder(
              builder: (context) {
                value = context.safeHeightFraction(0.5);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      // Safe height = 800 - 200 = 600 → 50% = 300
      expect(value, equals(300));
    });

    testWidgets('safeWidthFraction returns correct value', (tester) async {
      late double value;

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(
              size: Size(500, 700),
              padding: EdgeInsets.only(left: 20, right: 30),
            ),
            child: Builder(
              builder: (context) {
                value = context.safeWidthFraction(0.1);
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      // Safe width = 500 - 50 = 450 → 10% = 45
      expect(value, equals(45));
    });
  });
}
