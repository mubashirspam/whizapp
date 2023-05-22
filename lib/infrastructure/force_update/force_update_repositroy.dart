import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:whizapp/core/main_failures.dart';
import 'package:whizapp/domain/force_update/i_help_center_repo.dart';
import 'package:whizapp/domain/force_update/model/force_update.dart';

@LazySingleton(as: IForceUpdateRepos)
class RemoteConfigRepository implements IForceUpdateRepos {
  @override
  Future<Either<MainFailure, ForceUpdate>> getFirebaseConfigData() async {
    // final defalutValue = <String, dynamic>{EndPoints.forceUpdate: '{"min_build_no":"0","message":"Update message"}'};

    // Future fetchAndActivate() async {
    //   await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //     fetchTimeout: const Duration(minutes: 1),
    //     minimumFetchInterval: const Duration(hours: 1),
    //   ));
    //   await remoteConfig.setDefaults(defalutValue);
    //   await remoteConfig.fetchAndActivate();
    // }

    try {
      // await fetchAndActivate();

      // String getHelpCenter = remoteConfig.getString(EndPoints.forceUpdate);
      // Map<String, dynamic> mapValues = json.decode(getHelpCenter);
      Map<String, dynamic> mapValues = {};
      log('Remote Config Data: $mapValues');
      return Right(ForceUpdate.fromJson(mapValues));
    } catch (e) {
      // log('Unable to fetch remote config. Default value will be used $e');
      // return Right(HelpCenterModel.fromJson(mapValues));
      return const Left(MainFailure.clientFailure());
    }
  }
}
