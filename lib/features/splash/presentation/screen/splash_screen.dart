import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/config/router/app_routes.dart';
import 'package:weather/features/weather/presentation/widgets/weather_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
    bool _isChecking = true;
  bool _hasPermissionError = false;
  bool _isPermanentlyDenied = false;
  late final Future<String> _appVersion;
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<void> _initialize() async {
    // حداقل دو ثانیه Splash نمایش داده شود.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
  final camera = await Permission.camera.request();
  final microphone = await Permission.microphone.request();
//  if (camera.isGranted && microphone.isGranted) {
//     context.go(AppRoutes.appProvider);
//   } else {
//     setState(() {
//       _hasPermissionError = true;
//     });
//   }  
  }

  Future<void> _checkPermissions() async {
    setState(() {
      _isChecking = true;
      _hasPermissionError = false;
      _isPermanentlyDenied = false;
    });

    // بررسی و درخواست دسترسی دوربین
    final cameraStatus = await Permission.camera.request();

    // بررسی و درخواست دسترسی میکروفون
    final microphoneStatus = await Permission.microphone.request();

    if (!mounted) return;

    final hasPermission =
        cameraStatus.isGranted && microphoneStatus.isGranted;

    if (hasPermission) {
      context.go('/home');
      return;
    }

    setState(() {
      _isChecking = false;
      _hasPermissionError = true;

      _isPermanentlyDenied =
          cameraStatus.isPermanentlyDenied ||
          microphoneStatus.isPermanentlyDenied;
    });
  }

  Future<void> _openSettings() async {
    await openAppSettings();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.go(AppRoutes.appProvider);
  }

  @override
  void initState() {
    super.initState();
    _appVersion = getAppVersion();
    _navigate();
    _initialize();

    // Permission.microphone.request();
    // Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: WeatherWidgets.getBackGroundImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png", width: 120),
                      FutureBuilder<String>(
                        future: _appVersion,
                        builder: (context, version) => Text(
                          'ورژن ${version.data}',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Future<String> getAppVersion() async {
  //   String appVersion = '';
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   appVersion = packageInfo.version;
  //   return appVersion;
  // }

  // Future<void> _navigate() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   return;
  // }
}
