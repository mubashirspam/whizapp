import 'package:dartz/dartz.dart';
import 'package:whizapp/core/main_failures.dart';
import 'package:whizapp/domain/force_update/model/force_update.dart';

abstract class IForceUpdateRepos {
  Future<Either<MainFailure, ForceUpdate>> getFirebaseConfigData();
}
