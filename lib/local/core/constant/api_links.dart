import '../../../Global/Core/Services/services.dart';

class ApiLinks {
  static const String serverLink = "http://192.168.1.8:5000"; //local host
  static const String serverLink2 = "http://192.168.1.20:5000"; //local host
  static const String imagesLink = "$serverLink/uploads";
  static Map<String, String> header = {
    "Accept": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${AppServices.token}",
  };

  static const String socketPort = serverLink;
  static const String uploadImage = "$serverLink/routes/addImage";
}
