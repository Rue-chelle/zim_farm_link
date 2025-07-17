import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/home/home_screen.dart';
import 'views/marketplace/marketplace_screen.dart';
import 'views/marketplace/add_listing_screen.dart';
import 'views/marketplace/listing_detail_screen.dart';
import 'views/donations/donations_screen.dart';
import 'views/donations/add_donation_screen.dart';
import 'views/assistant/assistant_screen.dart';
import 'views/shared/main_scaffold.dart';

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
  // Listing detail/edit still push directly with Navigator.push(...)
},
    );
  }
}
