import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';


class TranslationService extends GetxService {
  final translations = <String, Map<String, String>>{};
  final fallbackLocale = const Locale('en', 'US');

  // all supported language code
  static final languages = ['en'];

  // initialize the translation service by loading the assets/languages folder
  // the assets/languages folder contains file for each language
  Future<TranslationService> init() async {
    languages.forEach((lang) async {
      var file = await rootBundle.loadString('assets/languages/$lang.json').then(convert.jsonDecode);
      translations.putIfAbsent(lang, () => Map<String, String>.from(file));
    });
    return this;
  }

  List<Locale> supportedLocales() {
    return TranslationService.languages.map((locale) {
      return fromStringToLocale(locale);
    }).toList();
  }

  //read last saved locals
  Locale getLocale() {
    String? locale = GetStorage().read<String>('language');
    if (locale == null || locale.isEmpty) {
      locale = "en";//setting.value.mobileLanguage;
    }
    return fromStringToLocale(locale);
  }

  // Convert string code to local object
  Locale fromStringToLocale(String locale) {
    if (locale.contains('_')) {
      // en_US
      return Locale(locale.split('_').elementAt(0), locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(locale);
    }
  }
}
