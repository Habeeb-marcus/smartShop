// MyApp class
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shop/core/utility/darkmode/dark_theme_provider.dart';
import 'package:smart_shop/presentation/styles/spacings.dart';
import 'package:smart_shop/presentation/themes/theme_styles.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends  ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
  final themeChangeProvider = ref.read(themeProvider);
      // _coubter variable
  int _counter = 0;

  // _incrementCounter function
  void _incrementCounter() {
    _counter++;
  }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: [
          IconButton(
            onPressed: () {
              themeChangeProvider.setDarkTheme = !themeChangeProvider.darkTheme;
            },
            icon: Icon(
              themeChangeProvider.darkTheme
                  ? Icons.lightbulb
                  :Icons.mode_night),
          ),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            VSpace.large,
            Text('Chnage the color of the text when in dark mode', 
            // style: Styles.themeData(themeChangeProvider.darkTheme, context),
            ),

          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

