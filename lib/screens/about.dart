import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({required Key key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";

  late PackageInfo packageInfo;

  @override
  void initState() {
    loadInfo();
    super.initState();
  }

  Future<void> loadInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Text(
              appName,
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 32.0),
            Text(
              'Package: $packageName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 32.0),
            Text(
              'Version: $version',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32.0),
            Text(
              'Build Number: $buildNumber',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
