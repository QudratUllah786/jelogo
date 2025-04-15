import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jelogo/utils/global_instances.dart';

import '../enum/network_status.dart';
import '../utils/network_connectivity.dart';

Map<String, String> basicHeaderInfo() => {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };

Future<Map<String, String>> bearerHeaderInfo() async {
  // String accessToken = box.read('token');
  // String accessToken = "";

  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${accessToken.value}",
  };
}


class APIService {
  // Private constructor
  APIService._privateConstructor();

  // Singleton instance variable
  static APIService? _instance;

  //This code ensures that the singleton instance is created only when it's accessed for the first time.
  //Subsequent calls to APIService.instance will return the same instance that was created before.

  // Getter to access the singleton instance
  static APIService get instance {
    _instance ??= APIService._privateConstructor();
    return _instance!;
  }

  //method to check if the device is connected to internet
  Future<bool> isConnectedToInternet() async {
    NetworkStatus networkStatus =
        await NetworkConnectivity.instance.getNetworkStatus();

    if (networkStatus == NetworkStatus.online) {
      return true;
    } else {
      return false;
    }
  }

  /* -------------------------- Get method --------------------------*/
  Future<(Map<String?, dynamic>?, int?, String?, String?)> get(
      String url, bool isBasic,
      {int successCode = 200,
      int duration = 15,
      bool showResult = false,
      Map<String, dynamic>? queryParameters}) async {
    /* --------------- Encode query params to create final url --------------- */
    String finalUrl = '';
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();
    if (isConnected == false) {
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }
    try {
      final response = await http
          .get(
            Uri.parse(finalUrl),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("GET API RESPONSE ($finalUrl): ${response.body}");
        log("GET API STATUS CODE ($url): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('Get API call failed with status code ($url): ${response.statusCode}');
        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (
        null,
        null,
        "Failure",
        "Check your Internet Connection and try again!"
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($url)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($url)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again"
      );
    } catch (e) {
      log("This exception occured while hitting Get API call ($url): $e");

      return (null, null, null, null);
    }
  }

  /* --------------------- get list -------------------------*/
  Future<(List<dynamic>?, int?, String?, String?)> getList(
      String url, bool isBasic,
      {int successCode = 200,
      int duration = 30,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      final response = await http
          .get(
            Uri.parse(finalUrl),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("getlist API RESPONSE ${finalUrl} ($url): ${response.body}");
        log("getlist API STATUS CODE ($url): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          jsonDecode(response.body) as List<dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('Get API call failed with status code ($url): ${response.statusCode}');

        return (
          jsonDecode(response.body) as List<dynamic>,
          response.statusCode,
          "Faliure",
          "Something Went Wrong! Try Again",
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (
        null,
        null,
        'Failure',
        "Check your Internet Connection and try again!",
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($url)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($url)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($url): $e");

      return (
        null,
        null,
        "Failure",
        "Something Went Wrong! Try Again",
      );
    }
  }

  /*--------------------------- Post Method --------------------------- */
  Future<(Map<String, dynamic>?, int?, String?, String?)> post(
      String url, Map<String, dynamic> body, bool isBasic,
      {int successCode = 200,
      int duration = 30,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      // CustomSnackBars.instance.showFailureSnackbar(
      //     title: "No Internet Connection",
      //     message: "Please check your internet connection and try again!");
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      final response = await http
          .post(
            Uri.parse(finalUrl),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("POST API RESPONSE ($url): ${response.body}");
        log("POST API STATUS CODE ($url): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          response.body.isEmpty
              ? null
              : jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('POST API call failed with status code ($url): ${response.statusCode}');

        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (
        null,
        null,
        "Check your Internet Connection and try again!",
        'Failure'
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($url)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($url)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($url): $e");

      return (null, null, null, null);
    }
  }

  /*--------------------------- Post Method --------------------------- */
  Future<(List<dynamic>?, int?, String?, String?)> postwithListBody(
      String url, List<Map<String, dynamic>> body, bool isBasic,
      {int successCode = 200,
      int duration = 30,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      // CustomSnackBars.instance.showFailureSnackbar(
      //     title: "No Internet Connection",
      //     message: "Please check your internet connection and try again!");
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      log("BODY ::${body}");
      final response = await http
          .post(
            Uri.parse(finalUrl),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("POST API RESPONSE ($url): ${response.body}");
        log("POST API STATUS CODE ($url): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          response.body.isEmpty
              ? null
              : jsonDecode(response.body) as List<dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('POST API call failed with status code ($url): ${response.statusCode}');

        return (
          jsonDecode(response.body) as List<dynamic>,
          response.statusCode,
          null,
          null
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (
        null,
        null,
        "Check your Internet Connection and try again!",
        'Failure'
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($url)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($url)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($url): $e");

      return (null, null, null, null);
    }
  }

  // Patch Method
  Future<(Map<String, dynamic>?, int?, String?, String?)> patch(
      String url, Map<String, dynamic> body, bool isBasic,
      {int successCode = 200,
      int duration = 30,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      final response = await http
          .patch(
            Uri.parse(finalUrl),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("PATCH API RESPONSE ($finalUrl): ${response.body}");
        log("PATCH API STATUS CODE ($finalUrl): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('PATCH API call failed with status code ($finalUrl): ${response.statusCode}');

        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($finalUrl)');

      return (
        null,
        null,
        'Failure',
        "Check your Internet Connection and try again!",
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($finalUrl)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($finalUrl)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($finalUrl): $e");

      return (
        null,
        null,
        'Failure',
        "Something Went Wrong! Try Again",
      );
    }
  }

  Future<(Map<String, dynamic>?, int?, String?, String?)> put(
      String url, Map<String, dynamic> body, bool isBasic,
      {int successCode = 200,
      int duration = 30,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      return (
        null,
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      final response = await http
          .put(
            Uri.parse(finalUrl),
            body: jsonEncode(body),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("PUT API RESPONSE ($finalUrl): ${response.body}");
        log("PUT API STATUS CODE ($finalUrl): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('PUT API call failed with status code ($finalUrl): ${response.statusCode}');

        return (
          jsonDecode(response.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($finalUrl)');

      return (
        null,
        null,
        "Check your Internet Connection and try again!",
        'Failure'
      );
    } on TimeoutException {
      log('Error Alert Timeout Exception ($finalUrl)');

      return (null, null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($finalUrl)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($finalUrl): $e");

      return (null, null, null, null);
    }
  }

  // Delete method
  Future<(int?, String?, String?)> delete(String url, bool isBasic,
      {int successCode = 200,
      int duration = 15,
      bool showResult = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    String finalUrl = '';
    /* --------------- Encode query params to create final url --------------- */
    if (queryParameters != null && queryParameters.isNotEmpty) {
      String queryString = Uri(queryParameters: queryParameters).query;
      finalUrl = '$url?$queryString';
    } else {
      finalUrl = url;
    }

    /* --------------- check if the device is connected to internet --------------- */
    bool isConnected = await isConnectedToInternet();

    if (isConnected == false) {
      return (
        null,
        "No Internet Connection",
        'Please check your internet connection and try again!'
      );
    }

    try {
      final response = await http
          .delete(
            Uri.parse(finalUrl),
            headers: isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
          )
          .timeout(Duration(seconds: duration));

      if (showResult) {
        log("DELETE API RESPONSE ($url): ${response.body}");
        log("DELETE API STATUS CODE ($url): ${response.statusCode}");
      }

      if (response.statusCode == successCode) {
        return (response.statusCode, null, null);
      } else {
        log('DELETE API call failed with status code ($url): ${response.statusCode}');

        return (response.statusCode, null, null);
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (null, "Check your Internet Connection and try again!", 'Failure');
    } on TimeoutException {
      log('Error Alert Timeout Exception ($url)');

      return (null, "Request Timeout", "Something Went Wrong! Try Again");
    } on http.ClientException catch (err, stackrace) {
      log('Error Alert Client Exception ($url)');

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        "Client Exception",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("This exception occured while hitting Post API call ($url): $e");

      return (null, null, null);
    }
  }

  //post with multipart request
  Future<(Map<String, dynamic>?, int?, String?, String?)> postWithMultiPart(
      String url,
      bool isBasic,
      bool isPut,
      dynamic filePathOrList,
      String fileName,
      {int code = 200,
      Map<String, dynamic>? queryParameters = null,
      Map<String, dynamic>? requestBody = null,
      String multipartFileField = '',
      bool showResult = false}) async {
    try {
      String finalUrl = '';
      /* --------------- Encode query params to create final url --------------- */
      if (queryParameters != null && queryParameters.isNotEmpty) {
        String queryString = Uri(queryParameters: queryParameters).query;
        finalUrl = '$url?$queryString';
      } else {
        finalUrl = url;
      }

      /* --------------- check if the device is connected to internet --------------- */
      bool isConnected = await isConnectedToInternet();
      if (isConnected == false) {
        return (
          null,
          null,
          "No Internet Connection",
          "Please check your internet connection and try again!"
        );
      }

      String httpMethod = isPut ? 'PUT' : 'POST';

      // Creating a multipart request
      var request = http.MultipartRequest(
        httpMethod,
        Uri.parse(finalUrl),
      );

      // Add headers based on authentication method
      request.headers.addAll(
        isBasic ? basicHeaderInfo() : await bearerHeaderInfo(),
      );

      log("fileField: $multipartFileField");
      try {
        // Determine if the filePathOrList is a single file path or a list of file paths
        if (filePathOrList is List<String>) {
          print("list of files are passed");
          //Check if it's a list of file paths
          if (filePathOrList.isNotEmpty) {
            // Iterate through the list and add each file path as a multipart file
            for (var path in filePathOrList) {
              request.files.add(await http.MultipartFile.fromPath(
                multipartFileField,
                path,
              ));
            }
          }
        } else if (filePathOrList is String) {
          // If it's a single file path, add it as a single multipart file
          request.files.add(await http.MultipartFile.fromPath(
            multipartFileField,
            filePathOrList,
          ));
        }

        // Add fields to the request if it is not null
        if (requestBody != null) {
          // Add fields to the request
          requestBody.forEach((key, value) {
            if (value != null) {
              request.fields[key] = value.toString();
            }
          });
        }
      } catch (e) {
        print('Error uploading file: $e');
      }

      http.StreamedResponse response = await request.send();
      //var response = await request.send();
      var jsonData = await http.Response.fromStream(response);

      if (showResult) {
        log("response: ${jsonData.body}");
        log("status code: ${response.statusCode}");
      }

      if (response.statusCode == code) {
        return (
          jsonDecode(jsonData.body) as Map<String, dynamic>,
          response.statusCode,
          null,
          null
        );
      } else {
        log('Multipart POST API call failed with status code ($url): ${response.statusCode}');
        return (
          jsonDecode(jsonData.body) as Map<String, dynamic>,
          response.statusCode,
          "Failure",
          "Something Went Wrong! Try Again",
        );
      }
    } on SocketException {
      log('Error Alert on Socket Exception ($url)');

      return (
        null,
        null,
        "Failure",
        "Please check your internet connection and try again"
      );
    } on TimeoutException {
      log('Error Alert on timeout Exception ($url)');

      return (
        null,
        null,
        "Request Timeout",
        "Request timeout, please try again"
      );
    } on http.ClientException catch (err, stackrace) {
      log("Client exception occurred for url: $url");

      log(err.toString());

      log(stackrace.toString());

      return (
        null,
        null,
        "Failure",
        "Something Went Wrong! Try Again",
      );
    } catch (e) {
      log("this exception occurred while calling post API with multipart: $e");

      return (
        null,
        null,
        "Failure",
        "Something Went Wrong! Try Again",
      );
    }
  }
}
