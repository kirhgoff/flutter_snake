import 'package:pigeon/pigeon.dart';

class SavedJobList {
  List<SavedJob> job;
}

class SavedJob {
  String title;
}

@FlutterApi()
abstract class Api2Flutter {
  void showSavedJobs(SavedJobList jobs);
}

@HostApi()
abstract class Api2Host {
  void removeSavedJob(SavedJob job);
}