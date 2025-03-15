import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/core/locales.g.dart';
import 'app/base/base_common.dart';
import 'app/resources/themes.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BaseCommon.instance.init().then((_) {
    runApp(const MyApp());
  });}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Budget Control',
      theme: greenTheme,
      darkTheme: darkTheme,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translations,
      locale: Locale(BaseCommon.instance.locale,BaseCommon.instance.locale.toUpperCase()),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}