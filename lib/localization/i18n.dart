import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class I18NLocalizations {
  I18NLocalizations(this.locale);

  final Locale locale;

  static I18NLocalizations of(BuildContext context) {
    return Localizations.of<I18NLocalizations>(context, I18NLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'Login': 'Login',
      'loginText': 'Login with Google',
      'appleText': 'Login with Apple ID',
      'signOut': 'Sign Out',
    },

  };

  static List<String> languages ()=> _localizedValues.keys.toList();

  String get login {
    return _localizedValues[locale.languageCode]!['Login']!;
  }
  String get loginText {
    return _localizedValues[locale.languageCode]!['loginText']!;
  }
  String get appleText {
    return _localizedValues[locale.languageCode]!['appleText']!;
  }

  String get signOut {
    return _localizedValues[locale.languageCode]!['signOut']!;
  }
}
// #enddocregion Demo

// #docregion Delegate
class I18NLocalizationsDelegate
    extends LocalizationsDelegate<I18NLocalizations> {
  const I18NLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => I18NLocalizations.languages().contains(locale.languageCode);


  @override
  Future<I18NLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<I18NLocalizations>(I18NLocalizations(locale));
  }

  @override
  bool shouldReload(I18NLocalizationsDelegate old) => false;
}