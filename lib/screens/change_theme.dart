import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/widgets/widgets.dart';
import 'package:proj/blocs/app_blocs.dart';

class ChangeThemePage extends StatelessWidget {
  const ChangeThemePage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SelectColorCard(
              color: Colors.green,
              onTap: () {
                themeCubit.toGreen();
              },
              title: 'Green',
              key: UniqueKey(),
            ),
            SelectColorCard(
              color: Colors.purple,
              onTap: () {
                themeCubit.toPurple();
              },
              title: 'Purple',
              key: UniqueKey(),
            ),
            SelectColorCard(
              color: Colors.red,
              onTap: () {
                themeCubit.toRed();
              },
              title: 'Red',
              key: UniqueKey(),
            ),
            SelectColorCard(
              color: Colors.blue,
              onTap: () {
                themeCubit.toBlue();
              },
              title: 'Blue',
              key: UniqueKey(),
            ),
          ],
        ),
      ),
    );
  }
}
