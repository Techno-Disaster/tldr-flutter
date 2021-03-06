import 'package:flutter/material.dart';
import 'package:tldr/command/models/command.dart';
import 'package:tldr/screens/about_app.dart';
import 'package:tldr/screens/command_details.dart';
import 'package:tldr/screens/favorites_screen.dart';
import 'package:tldr/screens/recents_screen.dart';
import 'package:tldr/screens/search_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case commandDetails:
        final Command command = settings.arguments as Command;
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => CommandDetails(command: command),
        );
      case searchPage:
        final List<Command> commands = settings.arguments as List<Command>;
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => SearchScreen(
            commands: commands,
          ),
        );
      case aboutPage:
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => AboutApp(),
        );
      case recentsPage:
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => RecentsSreen(),
        );
      case favoritesPage:
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => FavoritesScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Text('No route found'),
          ),
        );
    }
  }
}

const commandDetails = '/commandDetails';
const searchPage = '/searchPage';
const aboutPage = '/aboutPage';
const favoritesPage = '/favoritesPage';
const recentsPage = '/recentsPage';
