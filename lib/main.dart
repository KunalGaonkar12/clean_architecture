import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/route.dart';
import 'config/theme/app_theme.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
        create: (context)=>sl()..add(const GetArticles()),
        child:MaterialApp(
      theme: theme(),
      onGenerateRoute:AppRoutes.onGenerateRoutes,
      home:  DailyNews(),
    )) ;


  }
}

