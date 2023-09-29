
import 'package:flutter/material.dart';
import '../../Core/Constant/colors.dart';
import '../../../global/core/class/status_request.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
        : statusRequest == StatusRequest.failure
            ? const Center(child: Text("Failure"))
            : statusRequest == StatusRequest.offlineFailure
                ? const Center(child: Text("Offline"))
                : statusRequest == StatusRequest.serverFailure
                    ? const Center(child: Text("Failure"))
                    : child;
  }
}

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
        : child;
  }
}
