import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'theme.dart'; // The theme we defined earlier

void main() {
  runApp(const ZimFarmLinkApp());
}

class ZimFarmLinkApp extends StatelessWidget {
  const ZimFarmLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZimFarmLink',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      // Optional: use onGenerateRoute for custom page transitions if needed
    );
  }
}
