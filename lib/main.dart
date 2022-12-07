import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herb_shop/constants/routes.dart';
import 'package:herb_shop/constants/theme.dart';
import 'package:herb_shop/screens/splash_screen/splash_screen.dart';
import 'package:herb_shop/utilities/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: ((context, orientation) {
            SizeConfig().init(constraints, orientation);
            return const MyApp();
          }),
        );
      },
    ),
  );
}

// comment here jfks;ak
// comment here is available...
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      routes: routes,
      theme: theme(),
      home: const SplashScreen(),
    );
  }
}
// MultiProvider(
//       providers: [
//         // Provider(
//         // //   create: (context) => FavoriteListModel(),
//         // // ),
//         // // ChangeNotifierProxyProvider(
//         // //   create: (context) => FavoritePageModel(),
//         // //   update: (context, favoriteList, favoritePage) {
//         // //     if (favoritePage == null)
//         // //       throw ArgumentError.notNull('favoritePage');
//         // //     favoritePage.favoriteList = favoriteList;
//         //     return favoritePage;
//         // },
//         // ),
//       ],
//       child: