import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    // width: context.sizes.of(72),
                  ),
                  FutureBuilder<String>(
                    future: getAppVersion(),
                    builder: (context, version) =>
                        Text('ورژن ${version.data ?? ''}'),
                  ),
                  // SizedBox(height: context.sizes.of(10)),
                  // Text(
                  //   "کاواتل - پیام‌رسان آنلاین",
                  //   style: context.theme.textTheme.titleMedium?.copyWith(
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // Text(
          //   "ورژن ${AppUtils.appVersion}",
          //   style: context.theme.textTheme.titleMedium?.copyWith(
          //     color: context.colors.textFaint,
          //   ),
          // ),
          // SizedBox(height: context.height * 0.09),
        ],
      ),
    );
  }

  Future<String> getAppVersion() async {
    String appVersion = '';
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    return appVersion;
  }
}
