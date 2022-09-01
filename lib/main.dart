

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news-app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news-app/news_layout.dart';
import 'package:udemy_flutter/layout/todo-app/home_layout.dart';
import 'package:udemy_flutter/modules/counter/Counter_screen.dart';
import 'package:udemy_flutter/modules/login/Login_screen.dart';
import 'package:udemy_flutter/modules/messanger/Messanger_screen.dart';
import 'package:udemy_flutter/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:udemy_flutter/modules/users/Users_screen.dart';
import 'package:udemy_flutter/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_flutter/modules/home/home_screen.dart';
import 'package:udemy_flutter/modules/bmi/pmi_screen.dart';
import 'package:udemy_flutter/shared/bloc-observer.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark =CacheHelper.getData(key: 'isDark');
  runApp( MyApp(isDark!));
}
class MyApp extends StatelessWidget{
  @override

  final bool isDark;
  MyApp(this.isDark);
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()),
        BlocProvider(create: (BuildContext context)=> AppCubit()..changeAppMode(
          fromShared: isDark,
        ),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (Context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            darkTheme:darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:HomeLayout(),
          );
        },

      ),
    );

  }

}


