import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/firebase_options.dart';
import 'package:proj/screens/sign_in.dart';
import 'package:proj/screens/sign_up.dart';
import 'package:proj/screens/your_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:proj/blocs/app_blocs.dart';
import 'package:proj/repositories/repositories.dart';
import 'package:proj/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(new MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({
    required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return RepositoryProvider(
      create: (context) => TransactionsRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TransactionsBloc>(
            create: (context) => TransactionsBloc(
              transactionsRepository: context.read<TransactionsRepository>(),
            )..add(GetTransactions()),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              preferences: sharedPreferences,
            ),
          ),
        ],
        child: ExpenseTrackerApp(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          routes: {
            '/': (create) => SignInScreen(),
            '/home': (create) => MyHomePage(),
            '/SignUp': (create) => SignUpScreen(),
            '/settings': (create) => SettingsPage(key: UniqueKey()),
            '/your_account': (create) => YourAccount(key: UniqueKey()),
          },
          debugShowCheckedModeBanner: false,
          title: 'Hisaab Kitaab',
          initialRoute: '/',
          theme: state.theme,
          darkTheme: ThemeData.dark(),
        );
      },
    );
  }
}
