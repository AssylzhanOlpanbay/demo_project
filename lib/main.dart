import 'package:demo_practice/core/hive/open_provider_hive.dart';
import 'package:demo_practice/config/routes/app_routes.dart';
import 'package:demo_practice/config/routes/bottom_navigation_bar.dart';
import 'package:demo_practice/config/routes/route_generator.dart';
import 'package:demo_practice/features/presentation/events/components/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("open_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(
            create: (_) => OpenProviderHive(Hive.box("open_box")),
          ),
      ],
      child: BottomNavBar(),
    );
  }
}

