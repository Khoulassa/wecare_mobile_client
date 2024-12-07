
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_care/app/core/constants/data_constants.dart';

extension HttpFunctions on http.Client{


  getWithoutAuth( url)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();

    String lang = prefs.getString(AppConstants.lang) ?? "en";


    var response = await get(
      url,
      headers: {"lang": lang},
    );
    return response;
  }

getWithAuth( url)async{
 SharedPreferences prefs = await SharedPreferences.getInstance();
 prefs = await SharedPreferences.getInstance();
 const storage = FlutterSecureStorage();
 String lang = prefs.getString(AppConstants.lang) ?? "en";
 String? token = await storage.read(key:  AppConstants.keyAccessToken);

 print("@@$token");

var response = await get(
  url,
  headers: {"lang": lang, "Authorization": "Bearer $token"},
 );
return response;
}

getWithAuthAndUuid( url)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  String lang = prefs.getString(AppConstants.lang) ?? "en";
  String? token = await storage.read(key:  AppConstants.keyAccessToken);

  String uuid = await storage.read(key:  AppConstants.keyAccessUuid)??"";

  var response = await get(
    url,
    headers: {
      "lang": lang,
      "uuid": uuid,
      "Authorization": "Bearer $token"
    },
  );
  return response;
}


postWithUuid( url,body)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  /// unique device uuid ///
  String uuid = await PlatformDeviceId.getDeviceId??'';
  await storage.write(key: AppConstants.keyAccessUuid, value: uuid);

  String lang = prefs.getString(AppConstants.lang) ?? 'en';


  var response = await post(
    url,
    headers: {

     "Content-Type":"application/json;charset=UTF-8",
      "lang": lang,
      "uuid": uuid,
    },
    body: body
  );
  return response;
}
postWithoutAuth( url,body)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();

  String lang = prefs.getString(AppConstants.lang) ?? "en";


  var response = await post(
      url,
      headers: {
        "lang": lang,

      },
      body: body
  );
  return response;
}

postWithAuth( url,body)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();
  const storage = FlutterSecureStorage();
  String? token =  await storage.read(key:AppConstants.keyAccessToken) ;
  String lang = prefs.getString(AppConstants.lang) ??"en";


  var response = await post(
      url,
      headers: {"lang": lang, "Authorization": "Bearer $token"},
      body: body
  );
  return response;
}

}

