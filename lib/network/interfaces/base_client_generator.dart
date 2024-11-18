
import '../api_services.dart';

class BaseClientGenerator{

  String  path = "";
  String method = "POST";
  String baseURL = ApiServices.baseUrl;
  bool  shouldDisplayPopUp= true;
  bool  shouldDisplayLoadingIndicator = true;
  dynamic  body;
  Map<String,dynamic>?  queryParameters;
  Map<String,dynamic>  header = {
    "Accept": "application/json",
    "Content-Type" : "application/x-www-form-urlencoded",
    "Authorization" : "Bearer ACCESS_TOKEN}"
  };
  int  sendTimeout = 30000;
  int  receiveTimeOut = 30000;
}