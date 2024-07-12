import 'package:bloc_1_qism/cubid/theme_cubid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return SwitchListTile(
            title: const Text("Change Theme"),
            value: isDarkMode,
            onChanged: (bool value) {
              context.read<ThemeCubit>().changeTheme();
            },
          );
        },
      ),
    );
  }
}
