import 'package:bloc_1_qism/cubid/counter_cubid.dart';
import 'package:bloc_1_qism/cubid/theme_cubid.dart';
import 'package:bloc_1_qism/ui/screens/settings_screen.dart';
import 'package:bloc_1_qism/ui/screens/test_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counterCubid = context.read<CounterCubid>();
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                "Menu",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsScreen();
                    },
                  ),
                );
              },
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TestScreen1();
                    },
                  ),
                );
              },
              title: const Text("Test"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              counterCubid.decrement();
            },
            icon: const Icon(
              Icons.remove_circle,
            ),
          ),
          IconButton(
            onPressed: () {
              counterCubid.increment();
            },
            icon: const Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CounterCubid, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}
