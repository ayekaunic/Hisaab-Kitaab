import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proj/models/models.dart';
import 'package:proj/screens/screens.dart';
import 'package:proj/screens/sign_in.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:proj/screens/sign_up.dart';
import 'package:proj/screens/your_account.dart';

import 'MockFireBaseAuth.dart';

void main() {
  // sign in screen
  testGoldens('Sign in screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: SignInScreen(),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Sign in');
  });

  // settings screen
  testGoldens('Settings screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: SettingsPage(key: UniqueKey()),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Settings');
  });

  // home screen
  // testGoldens('Home screen renders correctly.', (tester) async {
  //   final widget = MaterialApp(
  //     home: MyHomePage(),
  //   );

  //   await tester.pumpWidgetBuilder(
  //     widget,
  //     surfaceSize: const Size(500, 1000),
  //   );

  //   await screenMatchesGolden(tester, 'Home');
  // });

  // sign up screen
  testGoldens('Sign up screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: SignUpScreen(),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Sign up');
  });

  // your account screen
  testGoldens('Your account screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: YourAccount(key: UniqueKey(), auth: MockFirebaseAuth()),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Your account');
  });

  // search screen
  // testGoldens('Search screen renders correctly.', (tester) async {
  //   final widget = MaterialApp(
  //     home: SearchPage(key: UniqueKey()),
  //   );

  //   await tester.pumpWidgetBuilder(
  //     widget,
  //     surfaceSize: const Size(500, 1000),
  //   );

  //   await screenMatchesGolden(tester, 'Search');
  // });

  // developer screen
  testGoldens('Developer screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: DeveloperPage(key: UniqueKey()),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Developer');
  });

  // details screen
  testGoldens('Details screen renders correctly.', (tester) async {
    final widget = MaterialApp(
      home: DetailsPage(
        key: UniqueKey(),
        transaction: Transaction(
          id: "1",
          title: "Groceries",
          amount: 20,
          date: DateTime(2021, 6, 23),
          createdOn: DateTime(2021, 6, 23),
        ),
      ),
    );

    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(500, 1000),
    );

    await screenMatchesGolden(tester, 'Details');
  });

  // change theme screen
  // testGoldens('Change theme screen renders correctly.', (tester) async {
  //   final widget = MaterialApp(
  //     home: ChangeThemePage(key: UniqueKey()),
  //   );

  //   await tester.pumpWidgetBuilder(
  //     widget,
  //     surfaceSize: const Size(500, 1000),
  //   );

  //   await screenMatchesGolden(tester, 'Change theme');
  // });
}
