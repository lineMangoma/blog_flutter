import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/framework/blogLocalServiceImpl.dart';
import 'package:blog_mobile/framework/blogNetworkServiceImpl.dart';
import 'package:blog_mobile/pages/CreationCompte/CreationComptePage.dart';
import 'package:blog_mobile/pages/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setup() {
  var host = dotenv.env['HOST'];
  getIt.registerLazySingleton<BlogNetworkService>(() {
    return BlogNetworkServiceImpl(base_url: host);
  });
  getIt.registerLazySingleton<BlogLocalService>(() {
    return BlogLocalServiceImpl();
  });
}

void main() async {
  await dotenv.load(fileName: ".env");
  setup();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CreationComptePage(),
    );
  }
}
