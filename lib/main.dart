import 'package:doctorly/core/constants/app_color.dart';
import 'package:doctorly/presentation/ui/screens/auth/register_screen.dart';
import 'package:doctorly/presentation/ui/screens/auth/verify_screen.dart';
import 'package:doctorly/presentation/ui/screens/main/main_screen.dart';
import 'package:doctorly/presentation/ui/screens/onboarding/introduction_screen.dart';
import 'package:doctorly/utils/my_pref.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            String? token = snapshot.data as String?;

            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: 'SfProDisplay',
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This woqrks for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: AppColor.BlueMain),
                useMaterial3: false,
              ),
              home: token != null && token.isNotEmpty
                  ? const MainScreen() 
                  : const IntroductionScreen(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<String?> init() async {
    await Prefs.init();

    return Prefs.getAccessToken();
  }
}
