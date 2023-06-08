part of 'theme_cubit.dart';

enum ThemeColor {
  red,
  purple,
  blue,
  green,
}

final appBarTheme = AppBarTheme(
  titleTextStyle: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  toolbarTextStyle: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 16,
  ),
);

final purpleTheme = ThemeData(
  primarySwatch: Colors.purple,
  hintColor: Colors.amber,
  fontFamily: 'Poppins',
  appBarTheme: appBarTheme,
);

final greenTheme = ThemeData(
  primarySwatch: Colors.green,
  hintColor: Colors.amber,
  fontFamily: 'Poppins',
  appBarTheme: appBarTheme,
);

final redTheme = ThemeData(
  primarySwatch: Colors.red,
  hintColor: Colors.grey[350],
  fontFamily: 'Poppins',
  appBarTheme: appBarTheme,
);

final blueTheme = ThemeData(
  primarySwatch: Colors.blue,
  hintColor: Colors.blueGrey.shade200,
  fontFamily: 'Poppins',
  appBarTheme: appBarTheme,
);

class ThemeState extends Equatable {
  final ThemeColor color;
  final ThemeData theme;

  ThemeState({
    required this.color,
    required this.theme,
  });

  factory ThemeState.initial() {
    return ThemeState(color: ThemeColor.green, theme: greenTheme);
  }

  @override
  List<Object> get props => [color, theme];

  ThemeState copyWith({
    required ThemeColor color,
    required ThemeData theme,
  }) {
    return ThemeState(
      color: color,
      theme: theme,
    );
  }
}
