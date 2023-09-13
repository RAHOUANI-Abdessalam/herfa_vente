import 'package:flutter/material.dart';
import 'package:herfa_vente/models/command.dart';

class CommandsProvider with ChangeNotifier {
  final List<CommandItem> commands = [
    CommandItem(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      createdAt: DateTime.now(),
      status: "done",
    ),
    CommandItem(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      createdAt: DateTime.now(),
      status: "done",
    ),
    CommandItem(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      createdAt: DateTime.now(),
      status: "done",
    ),
  ];

  void addCommand(CommandItem newCommand) {
    commands.add(newCommand);
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  void removeCommand(int index) {
    commands.removeAt(index);
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}
