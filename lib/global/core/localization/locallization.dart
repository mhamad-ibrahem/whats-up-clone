import 'package:get/get.dart';
import 'arabic.dart';
import 'english.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        
        //arabic translate
          
        'ar': arabicLanguage,

        // english translate

        'en': englishLanguage,
      };
}
