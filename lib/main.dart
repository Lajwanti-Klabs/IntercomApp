import 'package:flutter/material.dart';
import 'package:intercom_flutter/intercom_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: make sure to add keys from your Intercom workspace.
  //Intercom.setLogLevel(Intercom.LogLevel.VERBOSE);
  await Intercom.instance.initialize(
    'az2u7sjt',
    androidApiKey: 'android_sdk-218cc5611347f2deb534bc2f0ae1d63dda25cb7b',
    iosApiKey: 'ios_sdk-74b85bbeaf366acbf9563f1ffdff7a32f9f53b63',
  );
  // TODO: don't forget to set up the custom application class on Android side.
  runApp(SampleApp());
}

class SampleApp extends StatefulWidget {
  @override
  State<SampleApp> createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intercom example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              // NOTE:
              // Messenger will load the messages only if the user is registered
              // in Intercom.
              // Either identified or unidentified.
              // So make sure to login the user in Intercom first before opening
              // the intercom messenger.
              // Otherwise messenger will not load.

             await Intercom.instance.loginIdentifiedUser(userId: "12345");


               await Intercom.instance.displayMessages();

              await Intercom.instance.displayMessenger();

            },
            child: const Text('Show messenger'),
          ),
        ),
      ),
    );
  }
}
