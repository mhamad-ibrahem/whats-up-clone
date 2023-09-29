


import '../Class/status_request.dart';

handlingData(response) {
  //to handle the response in api functions
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
