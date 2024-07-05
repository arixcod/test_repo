import 'dart:async';

// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/page_routes.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';
import 'package:app_links/app_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {});

  runApp(
    ScreenUtilInit(
      designSize: Size(360, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MandirWiki(),
    ),
  //     DevicePreview(
  //   enabled: true,
  //   tools: const [
  //     ...DevicePreview.defaultTools,
  //     // CustomPlugin(),
  //   ],
  //   builder: (context) =>
  //       ScreenUtilInit(
  //     designSize: Size(360, 932),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, _) => MandirWiki(),
  //   ),
  // )
  );
}

class MandirWiki extends StatefulWidget {
  const MandirWiki({super.key});

  @override
  State<MandirWiki> createState() => _MandirWikiState();
}

class _MandirWikiState extends State<MandirWiki> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    print("uri link pressed");
    // _navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      initialRoute: RouteName.splash_screen,
      getPages: AppRoutes.appRoutes(),
      // home:QRCodeScreen()
      //SplashScreen(),
    );
  }
}
