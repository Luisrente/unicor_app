import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sittca/src/app/context/app_assets.dart';
// import 'package:sittca/src/app/context/localizations/app_localizations.dart';
// import 'package:sittca/src/app/ui/widgets/custom/filter_drawer.dart';
// import 'package:sittca/src/app/ui/widgets/widget_export.dart';

import '../../../context/export_context.dart';
import '../export_widget.dart';

Widget buildTitleAndCheckAction(
    String title, Function(bool? value) onChanged, bool value) {
  return Row(
    children: [
      buildTitleText(title),
      const Spacer(),
      Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    ],
  );
}

Widget buildLoadingIndicator() {
  return Container(
    color: AppAssets.whiteColor,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      backgroundColor: AppAssets.whiteColor,
      color: AppAssets.primaryColor,
    ),
  );
}

Widget buildTitleAndEditAction(
    String title, bool isEditable, Function() onEditTapped) {
  // AppLocalizations l10n = AppLocalizations();
  return Row(
    children: [
      buildTitleText(title),
      const Spacer(),
      if (isEditable)
        TextButton(
          onPressed: onEditTapped,
          child: Text(
            "l10n.edit",
            style: const TextStyle(
                decoration: TextDecoration.underline, color: Colors.black),
          ),
        ),
    ],
  );
}

Widget buildTitleButton(
    String title, bool isEditable, Function() onEditTapped) {
  // AppLocalizations l10n = AppLocalizations();
  return Row(
    children: [
      if (isEditable)
        TextButton(
          onPressed: onEditTapped,
          child: buildTitleText(title)
        ),
    ],
  );
}

Widget buildCard(Size size, List<Widget> items) {
  return SizedBox(
    width: size.width,
    child: Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromARGB(255, 199, 199, 199),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ),
    ),
  );
}

Widget buildImageContent(String? path, double height) {
  return (path != null && path.isNotEmpty)
      ? Image.file(
          File(path),
          height: height,
          width: height,
          fit: BoxFit.contain,
        )
      : Container(
          width: 200.0,
          height: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0)),
          child: const Icon(Icons.no_photography),
        );
}

Widget buildImageContentLoad(String? path, double height, double width) {
  return (path != null && path.isNotEmpty)
      ? Image.network(
          path,
          height: height,
          width: width,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: 200.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(l10n.erroImage),
                  Icon(Icons.no_photography),
                ],
              ),
            );
          },
        )
      : Container(
          width: 200.0,
          height: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0)),
          child: const Icon(Icons.no_photography),
        );
}

Widget buildTitleText(String content) {
  return TitleText(
    content,
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    textStyle: const TextStyle(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
    alignment: Alignment.centerLeft,
  );
}

Widget buildContentText(String? content) {
  return TitleText(
    content ?? 'l10n.withoutInformation',
    textStyle: const TextStyle(color: Colors.black, fontSize: 16.0),
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    alignment: Alignment.centerLeft,
  );
}

Widget buildDetailQuantityRow(String label, String quantity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TitleText(
        label,
        alignment: Alignment.centerLeft,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          quantity,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      )
    ],
  );
}

// Widget buildGeolocation(double size, LatLng location) {
//   Map<MarkerId, Marker> _marcadores = <MarkerId, Marker>{};

//   CameraPosition _klake() {
//     return CameraPosition(target: location, zoom: 13);
//   }

//   void _anadir() {
//     int _contadorIdMarcador = 1;
//     final String cadenaIdMarcador = 'marcador_id_$_contadorIdMarcador';
//     final MarkerId idMarcador = MarkerId(cadenaIdMarcador);
//     final Marker marcador = Marker(
//       markerId: idMarcador,
//       position: location,
//     );
//     _marcadores[idMarcador] = marcador;
//   }

//   CameraPosition _kGooglePlex() {
//     return CameraPosition(
//       target: location,
//       zoom: 50,
//     );
//   }

//   Completer<GoogleMapController> _controller = Completer();

//   _anadir();
//   return GestureDetector(
//       child: Container(
//           constraints: BoxConstraints(maxWidth: size),
//           height: 400.0,
//           margin: const EdgeInsets.symmetric(horizontal: 20.0),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(10.0)),
//           child: GoogleMap(
//             markers: Set<Marker>.of(_marcadores.values),
//             mapType: MapType.normal,
//             initialCameraPosition: _klake(),
//             myLocationButtonEnabled: true,
//             scrollGesturesEnabled: true,
//             onMapCreated: (GoogleMapController controller) {},
//           )));
// }

// Widget buildGeolocations(Size size, List<LatLng> location) {
//   Map<MarkerId, Marker> _marcadores = <MarkerId, Marker>{};

//   CameraPosition _klake() {
//     return CameraPosition(target: LatLng(4.608543, -74.103886), zoom: 5);
//   }

//   void _anadir() {
//     int _contadorIdMarcador = 1;
    
//     for (var element in location) {
//     final String cadenaIdMarcador = 'marcador_id_$_contadorIdMarcador';
//     final MarkerId idMarcador = MarkerId(cadenaIdMarcador);
//     final Marker marcador = Marker(
//       markerId: idMarcador,
//       position: element,
//     );
//     _marcadores[idMarcador]=marcador;
//     _contadorIdMarcador++;
//     }
//   }

//   CameraPosition _kGooglePlex() {
//     return CameraPosition(
//       target: location[0],
//       zoom: 50,
//     );
//   }

//   Completer<GoogleMapController> _controller = Completer();

//   _anadir();
//   return GestureDetector(
//       child: Container(
//           constraints: BoxConstraints(maxWidth: size.width),
//           height: size.height * 0.8,
//           margin: const EdgeInsets.symmetric(horizontal: 20.0),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(10.0)),
//           child: GoogleMap(
//             markers: Set<Marker>.of(_marcadores.values),
//             mapType: MapType.normal,
//             initialCameraPosition: _klake(),
//             myLocationButtonEnabled: true,
//             scrollGesturesEnabled: true,
//             onMapCreated: (GoogleMapController controller) {},
//     )));
// }
