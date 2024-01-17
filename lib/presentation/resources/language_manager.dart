enum LanguageType {
  english,
  arabic,
}

const String Arabic = 'ar';
const String English = 'en';

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return English;
      case LanguageType.arabic:
        return Arabic;
    }
  }
}
