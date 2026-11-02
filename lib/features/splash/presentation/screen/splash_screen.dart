import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather/core/responsive/media_query_extensions.dart';

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
                    width:120,
                  ),
                  FutureBuilder<String>(
                    future: getAppVersion(),
                    builder: (context, version) =>
                        Text('ورژن ${version.data}',style: TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
          
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
