import 'package:dartz/dartz.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/error_handler.dart';

import 'package:tut_app/data/network/failure.dart';

import 'package:tut_app/data/network/requests.dart';

import 'package:tut_app/domain/model/models.dart';

import '../../domain/repository/repo.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequests loginRequests) async {
    if (await _networkInfo.isConnection) {
      // it's connected to internet so it's safe to call API

      try {
        var response = await _remoteDataSource.login(loginRequests);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return data -> [either right]
          return Right(response.toDoMain());
        } else {
          // failure -- return business error -> [either left]
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (err) {
        return left(ErrorHandler.handle(err).failure);
      }
    } else {
      // return internet connection error -> [either left]
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
