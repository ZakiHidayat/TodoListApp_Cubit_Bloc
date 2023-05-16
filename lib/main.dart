import 'package:crud_todolist_cubit_bloc/cubit/product_cubit.dart';
import 'package:crud_todolist_cubit_bloc/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (_) => ProductCubit()..init(),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.homePage,
          routes: AppRoute.routes,
        ));
  }
}
