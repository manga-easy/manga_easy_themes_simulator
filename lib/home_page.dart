import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:theme_simulator/config_color_page.dart';
import 'package:theme_simulator/share_theme_service.dart';
import 'package:theme_simulator/theme_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final switchColor = ValueNotifier(true);
  final ShareThemeService shareThemeService = ShareThemeService();
  @override
  void initState() {
    ThemeService().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () async {
              final name = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Digite o nome do tema'),
                    content: TextField(
                        autofocus: true,
                        onSubmitted: (value) {
                          shareThemeService.shareTheme(value);
                        }),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      drawer: const Drawer(
        child: ConfigColorPage(),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Icon(
              Icons.icecream_outlined,
              color: ThemeService.backgroundIcon,
              size: 45,
            ),
            const SizedBox(height: 16),
            CoffeeButton(
              label: 'CoffeeButton',
              corTexto: ThemeService.primaryText,
              corButton: ThemeService.primaryColor,
              onPress: () {},
            ),
            const SizedBox(height: 16),
            CoffeeText(
              text: 'CoffeeText',
              color: ThemeService.backgroundText,
            ),
            const SizedBox(height: 16),
            CoffeeField(color: ThemeService.backgroundText),
            const SizedBox(height: 16),
            const CoffeeSearchField(),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: switchColor,
              builder: (context, _, __) {
                return CoffeeSwitchButton(
                  value: _,
                  onChanged: (v) => switchColor.value = v,
                  activeColor: ThemeService.backgroundIcon,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: ThemeService.primaryColor,
              ),
              height: 100,
              child: Center(
                child: CoffeeText(
                  text: 'primaryColor',
                  color: ThemeService.primaryText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
