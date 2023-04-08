import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:theme_simulator/theme_service.dart';

class ConfigColorPage extends StatefulWidget {
  const ConfigColorPage({super.key});

  @override
  State<ConfigColorPage> createState() => _ConfigColorPageState();
}

class _ConfigColorPageState extends State<ConfigColorPage> {
  Future<void> _openColorPicker(
      Color currentColor, Function(Color) onColorChanged) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: onColorChanged,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
        );
      },
    );
    ThemeService().notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            CoffeeButton(
              corButton: ThemeService.primaryColor,
              corTexto: ThemeService.primaryText,
              onPress: () {
                _openColorPicker(ThemeService.backgroundText, (color) {
                  setState(() {
                    ThemeService.backgroundText = color;
                  });
                });
              },
              label: 'backgroundText',
            ),
            const SizedBox(height: 16),
            CoffeeButton(
              corButton: ThemeService.primaryColor,
              corTexto: ThemeService.primaryText,
              onPress: () {
                _openColorPicker(ThemeService.backgroundColor, (color) {
                  setState(() {
                    ThemeService.backgroundColor = color;
                  });
                });
              },
              label: 'backgroundColor',
            ),
            const SizedBox(height: 16),
            CoffeeButton(
              corButton: ThemeService.primaryColor,
              corTexto: ThemeService.primaryText,
              onPress: () {
                _openColorPicker(ThemeService.backgroundIcon, (color) {
                  setState(() {
                    ThemeService.backgroundIcon = color;
                  });
                });
              },
              label: 'backgroundIcon',
            ),
            const SizedBox(height: 16),
            CoffeeButton(
              corButton: ThemeService.primaryColor,
              corTexto: ThemeService.primaryText,
              onPress: () {
                _openColorPicker(ThemeService.primaryText, (color) {
                  setState(() {
                    ThemeService.primaryText = color;
                  });
                });
              },
              label: 'primaryText',
            ),
            const SizedBox(height: 16),
            CoffeeButton(
              corButton: ThemeService.primaryColor,
              corTexto: ThemeService.primaryText,
              onPress: () {
                _openColorPicker(ThemeService.primaryColor, (color) {
                  setState(() {
                    ThemeService.primaryColor = color;
                  });
                });
              },
              label: 'primaryColor',
            ),
            Center(
              child: Text(
                'Background color',
                style: TextStyle(
                  color: ThemeService.backgroundText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
