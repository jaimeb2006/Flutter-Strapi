import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list/app/data/providers/notes_api.dart';
import 'package:shopping_list/app/data/providers/notes_provider.dart';
import 'package:shopping_list/app/global_widgets/button_with_style.dart';
import 'package:shopping_list/app/modules/splash/controllers/splash_controller.dart';
import '../controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  final homeController = HomeController.to;
  final spahController = Get.put(SplashController());
  final NotesAPI _api = Get.find<NotesAPI>();

  // final apiController = Get.put(ApiRequestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  showAlertCerrarSeccion(context);
                })
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              actionButton(
                  onClickAction: () => {_api.postNotes()},
                  colorText: Colors.white,
                  colorBackground: Colors.red,
                  textButton: 'Subtract'),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  showAlertCerrarSeccion(BuildContext context) {
    // set up the buttons
    Widget cancelButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.grey[300],
          primary: Colors.red,
        ),
        child: Container(
          width: 250,
          height: 45,
          alignment: Alignment.center,
          child: const Text(
            'Cancelar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }

    Widget cerrarSesionButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.grey[300],
          primary: Colors.green,
        ),
        child: Container(
          width: 250,
          height: 45,
          alignment: Alignment.center,
          child: const Text(
            'Cerrar Sesión ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        onPressed: () {
          homeController.logOut();
          // Navigator.of(context).pop();
        },
      );
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Cerrar Sesión ",
        textAlign: TextAlign.center,
      ),
      content: const Text("Está seguro de cerrar sesión ",
          textAlign: TextAlign.center),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cerrarSesionButton(),
            const SizedBox(height: 10),
            cancelButton(),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
