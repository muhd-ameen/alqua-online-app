import 'package:appwrite/appwrite.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:souq_alqua/helper/db_helper.dart';
import 'package:souq_alqua/screens/authentication/splash/splash_screen.dart';
import 'package:souq_alqua/screens/stories/provider/blog_provider.dart';
import 'package:souq_alqua/screens/cart/providers/appwrite_cart_provider.dart';
import 'package:souq_alqua/screens/order_screens/delivery_locations/providers/delivery_location_provider.dart';
import 'package:souq_alqua/screens/order_screens/orders/providers/appwrite_order_provider.dart';
import 'package:souq_alqua/screens/authentication/sign_in/provider/login_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/screens/home/provider/home_screen_provider.dart';
import 'package:shake_flutter/shake_flutter.dart';

import 'utils/routes.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Shake Configuration
  Shake.start('uNmFpGkFtjzMrfk5he7xKMERKHMjmGfwQxnD0K19',
      'ASnjbOtbp6EQCdpIlHjgwS9iYLDrkOAzRVv1RhFXeZVFzaoy9WVCVkJ');

  Client client = Client();

  client
      .setEndpoint(DbHelper.dbUrl)
      .setProject(DbHelper.projectId)
      .setSelfSigned(status: true);
  // For self signed certificates, only use for development

// OneSignal Initialization
  // Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("47055440-3068-4d27-8d90-5b289debeba3");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  // Locks the device orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  final Client client;

  const MyApp({super.key, required this.client});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AppwriteCartProvider()),
        ChangeNotifierProvider(create: (_) => BlogPostProvider()),
        ChangeNotifierProvider(create: (_) => AppwriteOrderProvider(client)),
        ChangeNotifierProvider(create: (_) => AddressProvider(client)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Souq Alqua',
        theme: AppTheme.lightTheme(context),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
