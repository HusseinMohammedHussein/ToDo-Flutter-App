class TaskStat {}

final class TaskInitial extends TaskStat {}

final class TaskLoadingState extends TaskStat {}

final class TaskSuccessState extends TaskStat {}

final class TaskFailureState extends TaskStat {
  final String errMessage;

  TaskFailureState({required this.errMessage});
}
