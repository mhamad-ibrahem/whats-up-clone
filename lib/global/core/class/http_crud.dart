import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../Local/Core/Constant/api_links.dart';
import '../Functions/check_internet_connection.dart';
import 'status_request.dart';
import 'dart:io';
import 'package:path/path.dart';

class HttpCrud {
  //http methods to use it get and add and delete and update data from Api

  Future<Either<StatusRequest, Map>> getData(
      {required String linkUrl, required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl),
            headers:
                isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header);
        log('=======================================');
        log('${response.statusCode}');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postData(
      {required String linkUrl,
      required Map body,
      required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl),
            body: body,
            headers:
                isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header);
        log('=======================================');
        log('${response.statusCode}');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
      {required String linkUrl, required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(Uri.parse(linkUrl),
            headers:
                isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header);
        log('=======================================');
        log('${response.statusCode}');
        log('=======================================');
        log(jsonDecode(response.body));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log("Catch error $e");
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> multiPartRequest(
      {required String linkUrl,
      required Map<String, dynamic> data,
      File? file,
      required bool isAuthorized}) async {
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest('POST', Uri.parse(linkUrl));
        request.headers.addAll(
          isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header,
        );
        var length = await file?.length();
        var stream = http.ByteStream(file!.openRead());
        if (length != 0) {
          var multiPartFile = http.MultipartFile('img', stream, length!,
              filename: basename(file.path));
          request.files.add(multiPartFile);
        }
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
        log('=======================================');
        log('${response.statusCode}');
        log('=======================================');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          log('=======================================');
          log('$responseBody');
          log('=======================================');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      log('catch error  $_');
      return const Left(StatusRequest.serverException);
    }
  }
}
