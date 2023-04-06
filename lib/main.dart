import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _textColor = Colors.black;
  Color _buttonColor = Color.fromARGB(211, 231, 198, 9);
  Color _elevatedButtonColor = Color.fromARGB(232, 250, 250, 250);
  Color _iconColor = Colors.black;
  Color _backgroundColor = Colors.white;
  Color _fundoColor = Colors.white;
  Color _appBarColor = Colors.blue;

  void _openColorPicker(Color currentColor, Function(Color) onColorChanged) {
    showDialog(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker App'),
        backgroundColor: _appBarColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              _openColorPicker(_textColor, (color) {
                setState(() {
                  _textColor = color;
                });
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.format_paint),
            onPressed: () {
              _openColorPicker(_appBarColor, (color) {
                setState(() {
                  _appBarColor = color;
                });
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.format_color_fill),
            onPressed: () {
              _openColorPicker(_fundoColor, (color) {
                setState(() {
                  _fundoColor = color;
                });
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: _fundoColor,
          child: Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Text color',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _textColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _openColorPicker(_buttonColor, (color) {
                        setState(() {
                          _buttonColor = color;
                        });
                      });
                    },
                    child: Text(
                      'Button color',
                      style: TextStyle(
                        color: _textColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _buttonColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _openColorPicker(_iconColor, (color) {
                        setState(() {
                          _iconColor = color;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.palette,
                      color: _iconColor,
                    ),
                    label: Text(
                      'Icon color',
                      style: TextStyle(
                        color: _textColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: _buttonColor, backgroundColor: _buttonColor),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Background color',
                        style: TextStyle(
                          color: _textColor,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
