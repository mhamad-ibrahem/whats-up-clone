import 'dart:io';

import '../../../../Global/Core/Class/http_crud.dart';
import '../../../Core/Constant/api_links.dart';

class ChatDetailsData {
  HttpCrud crud;
  ChatDetailsData(this.crud);

  uploadImage({
    required File image,
  }) async {
    var response = await crud.multiPartRequest(
        linkUrl:ApiLinks.uploadImage,
        data: {},
        isAuthorized: false,
        file: image);
    return response.fold((l) => l, (r) => r);
  }
}
