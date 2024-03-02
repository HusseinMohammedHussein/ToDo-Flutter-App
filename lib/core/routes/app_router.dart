import 'package:todo_app/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/create_task/presentation/views/create_task.dart';
import 'package:todo_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..fetchTasks(),
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: "/createTask",
      builder: (context, state) => BlocProvider(
        create: (context) => TaskCubit(),
        child: const CreateTask(),
      ),
    ),
  ],
);
