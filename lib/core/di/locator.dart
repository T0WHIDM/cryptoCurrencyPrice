import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/networks/dio_client.dart';
import 'package:flutter_application_1/data/datasource/coin_list_datasource.dart';
import 'package:flutter_application_1/data/datasource/coin_list_datasource_remote.dart';
import 'package:flutter_application_1/data/repositories/coin_list_repository_imp.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repository.dart';
import 'package:flutter_application_1/domain/useCase/all_coin_use_case.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  
  //Dio
  locator.registerSingleton<Dio>(DioClient.createDio());

  //dataSource
  locator.registerFactory<CoinListDatasource>(
    () => CoinListDatasourceRemote(locator<Dio>()),
  );

  //repository
  locator.registerFactory<CoinListRepository>(
    () => CoinListRepositoryImp(locator<CoinListDatasource>()),
  );

  //useCase
  locator.registerSingleton<AllCoinUseCase>(
    AllCoinUseCase(locator<CoinListRepository>()),
  );
}
