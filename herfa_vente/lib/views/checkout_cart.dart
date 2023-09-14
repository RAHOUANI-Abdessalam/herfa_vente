import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:herfa_vente/controllers/cart.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CheckOutCart extends StatefulWidget {
  const CheckOutCart({super.key});

  @override
  State<CheckOutCart> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Panier",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: cart.addedProducts.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.asset(
                        cart.addedProducts[i].imageUrl,
                        // height: 120,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        "${cart.addedProducts[i].name}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "${cart.addedProducts[i].price.toStringAsFixed(2)} DA",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            cart.remove(cart.addedProducts[i]);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              });
        },
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          child: BottomAppBar(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prix total',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Consumer<Cart>(
                        builder: (context, cart, child) {
                          return Text(
                            "${cart.totalprice.toStringAsFixed(2)} DA",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<Cart>(builder: (context, cart, child) {
                    return MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        // Add your button's functionality here
                        cart.addedProducts.length == 0
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Votre panier est vide, Essayez d'acheter"),
                                ),
                              )
                            : AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,

                                // borderSide: const BorderSide(
                                //   color: Colors.green,
                                //   width: 2,
                                // ),
                                width: 400,
                                buttonsBorderRadius: const BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                // dismissOnTouchOutside: false,
                                // dismissOnBackKeyPress: false,
                                // onDismissCallback: (type) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text('Dismissed by $type'),
                                //     ),
                                //   );
                                // },
                                headerAnimationLoop: true,
                                animType: AnimType.bottomSlide,
                                title: 'INFORMATION',
                                desc:
                                    'Voulez-vous valider pour recevoir un appel concernant votre commande',
                                showCloseIcon: true,
                                btnOkText: "Valider",
                                btnCancelText: "Annuler",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text('Votre demande a été confirmée'),
                                  //   ),
                                  // );
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.leftSlide,
                                    headerAnimationLoop: false,
                                    dialogType: DialogType.success,
                                    showCloseIcon: true,
                                    title: "succès",
                                    desc: "Votre demande a été confirmée",
                                    btnOkOnPress: () {
                                      debugPrint('OnClcik');
                                    },
                                    btnOkIcon: Icons.check_circle,
                                    // onDismissCallback: (type) {
                                    //   debugPrint('Dialog Dissmiss from callback $type');
                                    // },
                                  ).show();
                                },
                              ).show();
                      },
                      child: Text(
                        "Confirmer l'achat",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
