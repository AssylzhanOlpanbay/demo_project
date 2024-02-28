import 'package:demo_practice/config/routes/app_routes.dart';
import 'package:demo_practice/config/routes/route_generator.dart';
import 'package:demo_practice/features/presentation/events/components/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => EventProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppRoutes.navigationBar,
      ),
    );
  }
}

