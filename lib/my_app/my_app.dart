import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/style/theme.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../layout/news_layout.dart';

class MyApp extends StatelessWidget {
  final bool? isDark;
   const MyApp(this.isDark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getSports()
        ..getScience()
        ..changeMode(shared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'News',
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: NewsLayout(),
            );
          }),
    );


  }
}
