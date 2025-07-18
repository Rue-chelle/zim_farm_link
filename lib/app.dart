import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/shared/main_scaffold.dart';
import 'views/marketplace/add_listing_screen.dart';
import 'views/donations/add_donation_screen.dart';

class ZimFarmLinkApp extends StatelessWidget {
  const ZimFarmLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZimFarmLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScaffold(),
        '/add-listing': (context) => const AddListingScreen(),
        '/add-donation': (context) => const AddDonationScreen(),
        // Detail/edit screens are navigated via Navigator.push (not named routes)
      },
    );
  }
}
