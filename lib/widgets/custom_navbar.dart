import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool showNgoTab;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.showNgoTab = false,
  });

  @override
  Widget build(BuildContext context) {
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Market'),
      const BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Add'),
      const BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];

    if (showNgoTab) {
      items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'NGO',
      ));
    }

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: items,
    );
  }
}
// testing ngo user
// void seedNgoUser(LocalDatabase db) async {
//   final existing = await db.getUserProfiles();
//   if (existing.isEmpty) {
//     await db.insertUserProfile(
//       UserProfilesCompanion.insert(
//         fullName: "NGO Admin",
//         farmingType: "N/A",
//         email: Value("admin@ngo.org"),
//         phoneNumber: Value("123456789"),
//         location: Value("Harare"),
//         profileImage: const Value(null),
//         role: const Value("ngo"), // or "admin"
//       ),
//     );
//   }
// }
