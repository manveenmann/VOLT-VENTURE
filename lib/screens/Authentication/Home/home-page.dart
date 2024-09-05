import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> widgets = [
    const Text("LOCATION WITH MAP"), // 0
    const Text("ALL EV STATIONS"), // 1
    const Text("MY EV STATIONS"), // 2
    const Text("PROFILE PAGE"), // 3
  ];

  final List<BottomNavigationBarItem> navBaritems = [
    const BottomNavigationBarItem(
        backgroundColor: Colors.black,
        icon: Icon(Icons.add_location),
        label: "LOCATION"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: "HOME"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.cable_outlined), label: "STATIONS"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
  ];

  void logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed("/login");
    } catch (e) {
      print("Error during sign out: $e");
    }
  }

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 195, 247),
      appBar: AppBar(
        title: const Text(
          "VOLT VENTURE",
          style: TextStyle(
            color: Color.fromARGB(255, 80, 189, 240),
            fontSize: 16,
            backgroundColor: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(child: widgets[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: navBaritems,
        currentIndex: selectedIndex,
        selectedItemColor:  Color.fromARGB(255, 80, 189, 240),
        unselectedItemColor: Colors.white,
        onTap: onItemSelected,
      ),
    );
  }
}
