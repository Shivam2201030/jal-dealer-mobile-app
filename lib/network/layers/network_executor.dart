
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:jindal_dealer/utils/extensions/logs.dart';
import '../freezed/network_error.dart';
import '../freezed/result.dart';
import '../network_options/network_options.dart';
import 'network_decoder.dart';
import 'package:dio/dio.dart';
import 'network_connectivity.dart';
import 'network_creator.dart';
import '../interfaces/base_client_generator.dart';
import '../interfaces/base_network_model.dart';

class NetworkExecutor{

  //static bool debugMode = Get.isLogEnable;

  static Future<Result<T,T>> execute<T extends BaseNetworkModel>({required BaseClientGenerator route,required T responseType,NetworkOptions? options}) async {
     ("API: ${route.baseURL}${route.path}").log();
     ("Body: ${route.body}").log();

    // Check Network Connectivity

      try {

          ///Check Internet
          if (! await NetworkConnectivity.isConnected) {
            return const Result.failure(null);
          }
          if(route.shouldDisplayLoadingIndicator){
            return await Get.showOverlay<Result<T,T>>(asyncFunction:() async {
              var response = await NetworkCreator.shared.request(route: route,options: options);
              ('Response: ${response.data}').log();
              var data = NetworkDecoder.shared.decode<T>(response: response, responseType: responseType);

              return Result.success(data);
            },
                loadingWidget: const CircularProgressIndicator()
            );
          }else{

              var response = await NetworkCreator.shared.request(route: route,options: options);
              ('Response: ${response.data}').log();
              var data = NetworkDecoder.shared.decode<T>(response: response, responseType: responseType);

              return Result.success(data);

          }


        // NETWORK ERROR
      } on DioException catch (diorError) {
        return Result.failure(onDioError<T>(diorError,responseType));

        // TYPE ERROR
      } on TypeError catch (e) {
        ("${route.path} Type error=> ${NetworkError.type(error: e.toString())}").log();
        ("${route.path} => ${NetworkError.type(error: e.stackTrace.toString())}").log();
        return const Result.failure(null);
      }

      // No Internet Connection
    /*} else {
      ("No Internet Connection").log();
      if(route.shouldDisplayPopUp) {
        Get.defaultDialog(
            title: "",
            content: UiComponent.getInfoDialog(Strings.noInternetConnection.tr)
        );
      }
    }*/
    //return const Result.failure(null);
  }

  static T? onDioError<T extends BaseNetworkModel>(DioException diorError, responseType,){
    ("${diorError.requestOptions.path} ERROR=> ${diorError.response?.data?.toString()}").log();
    ("${diorError.requestOptions.path} ERROR=> ${diorError.toString()}").log();
    T? data;
    if(diorError.response!=null) {
      try{
        data = NetworkDecoder.shared.decode<T>(response: diorError.response!, responseType: responseType);
      }catch(error){
        "Log => Do error response convert in network_execution.dart".log();
      }
    }

    ///session expire on bellow message
    if(diorError.response?.statusCode == 440){
      clearSession();
    }

    return data;

  }

  static clearSession(){
    ///Session expire
    ///Logout Code over here
  }

}
