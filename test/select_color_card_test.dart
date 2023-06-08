import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proj/widgets/select_color_card.dart';

void main() {
  testWidgets('SelectColorCard onTap callback is called',
      (WidgetTester tester) async {
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SelectColorCard(
            onTap: () {
              onTapCalled = true;
            },
            color: Colors.red,
            title: 'Red',
            key: Key('selectColorCard'),
          ),
        ),
      ),
    );

    final cardFinder = find.byKey(Key('selectColorCard'));
    expect(cardFinder, findsOneWidget);

    await tester.tap(cardFinder);
    await tester.pump();

    expect(onTapCalled, true);
  });

  // testWidgets('SelectColorCard displays the correct title and color',
  //     (WidgetTester tester) async {
  //   const String title = 'Blue';
  //   final Color color = Colors.blue;

  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Material(
  //         child: SelectColorCard(
  //           onTap: () {},
  //           color: color,
  //           title: title,
  //           key: Key('selectColorCard'),
  //         ),
  //       ),
  //     ),
  //   );

  //   final cardFinder = find.byKey(Key('selectColorCard'));
  //   expect(cardFinder, findsOneWidget);

  //   final textFinder = find.text(title);
  //   expect(textFinder, findsOneWidget);

  //   final cardWidget = tester.widget<Card>(cardFinder);
  //   expect(cardWidget.color, color);
  // });
}
