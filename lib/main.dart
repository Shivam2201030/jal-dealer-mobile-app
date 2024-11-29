import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jindal_dealer/routes/route.dart';
import 'package:jindal_dealer/screens/auth/screen_login.dart';
import 'package:jindal_dealer/utils/translation_service.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async {
 // SystemChrome.setPreferredOrientations(
   //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //Initialize storage
  await GetStorage.init();
  await Get.put(TranslationService()).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final translationService = Get.find<TranslationService>();
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Jindal Dealer',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: translationService.supportedLocales(),
          translationsKeys: translationService.translations,
          locale: translationService.getLocale(),
          fallbackLocale: translationService.fallbackLocale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: ScreenLogin.routeName,
        );
      }
    );
  }
}

