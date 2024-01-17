import 'package:tut_app/data/network/app_api.dart';
import 'package:tut_app/data/response/responses.dart';

import '../network/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequests loginRequests);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequests loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
