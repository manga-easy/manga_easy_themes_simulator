import 'dart:convert';

import 'package:share/share.dart';
import 'package:theme_simulator/theme_service.dart';

class ShareThemeService {
  ShareThemeService();

  void shareTheme(String nome) {
    final themeJson = json.encode({
      "tema": nome,
      "primaryColor": ThemeService.primaryColor.toString(),
      "backgroundColor": ThemeService.backgroundColor.toString(),
      "backgroundText": ThemeService.backgroundText.toString(),
      "primaryText": ThemeService.primaryText.toString(),
      "backgroundIcon": ThemeService.backgroundIcon.toString(),
    });
    Share.share(themeJson, subject: 'Compartilhar tema');
  }
}
