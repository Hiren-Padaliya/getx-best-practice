import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern/app/modules/auth/splash_screen.dart';
import 'package:getx_pattern/app/theme/app_theme.dart';
import 'package:getx_pattern/app/translations/app_translations.dart';
import 'package:getx_pattern/app/utils/helpers/helpers.dart';
import 'package:getx_pattern/app/utils/helpers/initial_bindings.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  runApp(GetXPattern());
}

class GetXPattern extends StatelessWidget {
  const GetXPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.wait([
      loadSvg(context, "assets/image/intro.svg"),
    ]);

    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThemeData,
            defaultTransition: Transition.size,
            getPages: AppPages.pages,
            translationsKeys:AppTranslation.translations,
            locale: const Locale('en', 'US'),
            initialBinding: InitialBindings(),
            //initialRoute: Routes.LOGIN,
            home: SplashScreen(),
          );
        }
    );
  }
}
