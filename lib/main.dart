import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shop/l10n/l10n.dart';
import 'package:smart_shop/core/alerts/easy_loading_config.dart';
import 'package:smart_shop/core/utility/darkmode/dark_theme_provider.dart';
import 'package:smart_shop/presentation/themes/theme_styles.dart';
import 'package:smart_shop/presentation/views/my_app.dart';

void main() {
  configEasyLoading();
  runApp(
    const ProviderScope(child:  MyHomePage())
    );
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, });


  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>  with WidgetsBindingObserver{
  // DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  int _counter = 0;
  bool isBackground = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

    @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getCurrentAppTheme();
      },
    );
  }


   void getCurrentAppTheme() async {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    print('brightness: $brightness');
    bool isDarkMode = brightness == Brightness.dark;
    ref.read(themeProvider).setDarkTheme = isDarkMode ;
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(themeProvider);

  return MaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: Styles.themeData(provider.darkTheme, context),
      home: const MyApp(title: 'Flutter Demo Home Page'),
      builder: EasyLoading.init(),
      supportedLocales: L10n.all,
    );

  }
}


