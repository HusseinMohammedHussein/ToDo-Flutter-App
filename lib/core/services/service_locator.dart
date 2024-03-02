import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:todo_app/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
  getIt.registerSingleton<TaskCubit>(TaskCubit());
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}
