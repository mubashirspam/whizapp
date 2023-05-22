import 'package:dartz/dartz.dart';
import 'package:whizapp/core/main_failures.dart';
import 'package:whizapp/domain/help_center/model/help_center.dart';



abstract class IHelpRepos {
  Future<Either<MainFailure, HelpCenterModel>> getFirebaseConfigData();
}
