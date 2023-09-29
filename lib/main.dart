import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Global/Binding/Bindings.dart';
import 'Global/Core/Services/services.dart';
import 'Local/Core/Themes/theme.dart';
import 'local/core/constant/routes.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightsTheme,
          initialRoute: AppRoute.login,
          getPages: routes,
          initialBinding: AppBindings(),
        );
      },
    );
  }
}
