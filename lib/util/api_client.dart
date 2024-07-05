import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'local_database.dart';

class ApiClient {

  Future<Map<String, dynamic>?> postMethod({required uri,required body}) async {
    String statusCode='';
    Map<String, dynamic>? responseBody;
    Map<String, dynamic>? decodedResponse;
    String url=ApiConstants.baseUrl+uri;
    log("url: $url  body is $body");
    try {
      String? accessToken =await StorageUtil.read(ApiConstants.token);
      print("access token ===>> $accessToken");
      if(accessToken != null && accessToken.isNotEmpty) {
        final  response = await http.post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: {
              "Content-Type": "application/json",
              "Authorization" : "Bearer $accessToken"
            }
        );
        statusCode=response.statusCode.toString();
        debugPrint(response.statusCode.toString());

        // //if logout unfortunately
        // if(response.statusCode==302){
        //   showToastMsg("Please login");
        //   Get.offAll(()=>LoginScreen());
        // }
        decodedResponse=jsonDecode(response.body);
      }
      else {
        final response = await http.post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: {
              "Content-Type": "application/json",
            });
        statusCode=response.statusCode.toString();
        debugPrint(response.statusCode.toString());
        decodedResponse=jsonDecode(response.body);
      }
      print( "response $uri  $decodedResponse");
      if (decodedResponse!=null && decodedResponse['status']== true) {
        responseBody = decodedResponse;
      }
      else if ( decodedResponse!['status']==false) {
        showToastMsg(decodedResponse['message']);
        print(decodedResponse);
      }
    } on SocketException {
      showToastMsg("Internet Exception");
    } catch (e) {
      log(e.toString(),);
      showToastMsg("Server error $statusCode");
    } finally {}
    return responseBody;
  }

  Future<Map<String, dynamic>?> getMethod(uri) async {
    String url=ApiConstants.baseUrl+uri;
    String statusCode='';
    log("url: $url");
    Map<String, dynamic>? responseBody;
    Map<String, dynamic>? decodedResponse;
    try {
      String? accessToken = StorageUtil.read(ApiConstants.token);
      debugPrint("access token ===>> $accessToken");
      if(accessToken != null && accessToken.isNotEmpty) {
        final response = await http.get(Uri.parse(url),  headers: {
          "Authorization" : "Bearer $accessToken"
        });
        statusCode=response.statusCode.toString();
        debugPrint(response.statusCode.toString());
        decodedResponse=jsonDecode(response.body);
        print('response ${uri.toString()}   ${response.body}');

      }
      else {
        final response = await http.get(Uri.parse(url));
        statusCode=response.statusCode.toString();
        debugPrint(response.statusCode.toString());
        decodedResponse=jsonDecode(response.body);
        print('response${response.body}');

      }
      if (decodedResponse!=null && decodedResponse['status']==true) {
        responseBody = decodedResponse;
      }
      else if ( decodedResponse!['status'] ==false) {
        showToastMsg(decodedResponse['message']);
        print(decodedResponse);
      }
    } on SocketException {
      showToastMsg("Internet Exception");
    } catch (e) {
      log(e.toString());
      showToastMsg("Server error $statusCode");
    } finally {}
    return responseBody;
  }

  Future uploadPhoto({required filePath,required uri, required bool isList,imagePathList}) async {
    log("url: ${ApiConstants.baseUrl+uri}");
    String url=ApiConstants.baseUrl+uri;
    Map<String, dynamic>? responseBody;
    Map<String, dynamic>? decodedResponse;
    String? accessToken = StorageUtil.read(ApiConstants.token);
    print("access token ===>> $accessToken");
    var postUri = Uri.parse(url);
    var request = http.MultipartRequest("POST", postUri);
    var headers= {"Authorization" : "Bearer $accessToken"};
    request.headers.addAll(headers);
    //if isList
    if(isList){
      for (int i = 0; i < imagePathList.length; i++) {
        var file = await http.MultipartFile.fromPath('images[]', imagePathList[i]);
        request.files.add(file);
      }}
    else{
      request.files.add(await http.MultipartFile.fromPath('image', filePath));
    }
//
    var response = await request.send();
    print(request.fields);
    var responsed = await http.Response.fromStream(response);
    print("Status Code is ${response.statusCode}");
    print("Response ${responsed.body}");
    decodedResponse = json.decode(responsed.body);
    print("Response data $decodedResponse");
    if (decodedResponse!=null && decodedResponse['status'].toString() == "true") {
      print("----------success------------");
      responseBody=decodedResponse;
    }
    else if (decodedResponse!=null && decodedResponse['status'].toString()=='error') {
      showToastMsg(decodedResponse['error']);
      print(decodedResponse);

    }
    else{
      print("inside else");
    }
    return responseBody;
  }

  Future uploadPhotosList({required filePath,required uri}) async {
    log("url: ${ApiConstants.baseUrl+uri}");
    String url=ApiConstants.baseUrl+uri;
    Map<String, dynamic>? responseBody;
    Map<String, dynamic>? decodedResponse;
    String? accessToken = StorageUtil.read(ApiConstants.token);
    print("access token ===>> $accessToken");
    var postUri = Uri.parse(url);
    var request = http.MultipartRequest("POST", postUri);
    var headers= {"Authorization" : "Bearer $accessToken"};
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('image', filePath));
    var response = await request.send();
    print(request.fields);
    var responsed = await http.Response.fromStream(response);
    print("Status Code is ${response.statusCode}");
    print("Response ${responsed.body}");
    decodedResponse = json.decode(responsed.body);
    print("Response data $decodedResponse");
    if (decodedResponse!=null && decodedResponse['status'].toString() == "true") {
      print("----------success------------");
      responseBody=decodedResponse;
    }
    else if (decodedResponse!=null && decodedResponse['status'].toString()=='error') {
      showToastMsg(decodedResponse['error']);
      print(decodedResponse);

    }
    else{
      print("inside else");
    }
    return responseBody;
  }

}

