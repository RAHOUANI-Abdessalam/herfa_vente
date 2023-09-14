import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:herfa_vente/models/command.dart';
import 'package:herfa_vente/controllers/commandsProvider.dart';
import 'package:provider/provider.dart';

class MyCommandsScreen extends StatefulWidget {
  const MyCommandsScreen({super.key});

  @override
  _MyCommandsScreenState createState() => _MyCommandsScreenState();
}

class _MyCommandsScreenState extends State<MyCommandsScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            // Call the function to show the dialog
            _showCommandInputDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Consumer<CommandsProvider>(
          builder: (context, commandsProvider, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mes commandes",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: commandsProvider.commands.length,
                      itemBuilder: (context, index) {
                        final command = commandsProvider.commands[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: Colors.grey.shade300,
                            title: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 5),
                              child: Text(
                                command.text,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Text(
                                "Ajoutée en: ${command.createdAt.toString()}"),
                            leading: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  command.status == "waiting"
                                      ? Icons.hourglass_bottom
                                      : Icons.download_done_rounded,
                                  color: command.status == "waiting"
                                      ? Colors.blue[900]
                                      : Colors.green,
                                )),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Use the provider method to remove the command
                                commandsProvider.removeCommand(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  // Function to show the command input dialog
  void _showCommandInputDialog(BuildContext context2) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          title: Text(
            "Nouvelle commande",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            Consumer<CommandsProvider>(
              builder: (context, commandsProvider, child) {
                return TextButton(
                    onPressed: () {
                      // Get the text from the TextFormField
                      final commandText = textEditingController.text.trim();

                      // Check if the text is not empty
                      if (commandText.isNotEmpty) {
                        // Create a new CommandItem and add it to the list
                        final newCommand = CommandItem(
                            text: commandText,
                            createdAt: DateTime.now(),
                            status: "waiting");
                        // Use the provider instance to add the command
                        commandsProvider.addCommand(newCommand);

                        // Clear the text field
                        textEditingController.clear();

                        // Close the dialog
                        Navigator.of(context).pop();

                        AwesomeDialog(
                          context: context2,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          title: "succès",
                          desc:
                              "Votre commande a été ajoutée, vous allez recevoir un appel téléphonique",
                          btnOkOnPress: () {
                            debugPrint('OnClcik');
                          },
                          btnOkIcon: Icons.check_circle,
                          // onDismissCallback: (type) {
                          //   debugPrint('Dialog Dissmiss from callback $type');
                          // },
                        ).show();
                      }
                    },
                    child: Text(
                      "confirmer",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ));
              },
            ),
            TextButton(
                onPressed: () {
                  textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "quitter",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
          content: TextFormField(
            controller: textEditingController,
            maxLines: 15,
            minLines: 4,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                labelText: "Ajouter la commande",
                labelStyle: TextStyle(fontSize: 18),
                floatingLabelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        );
      },
    );
  }
}
