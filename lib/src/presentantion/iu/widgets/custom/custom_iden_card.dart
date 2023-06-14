import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../domain/models/export_model.dart';
import '../../../context/export_context.dart';
import '../../../utils/encryption_utils.dart';
import '../export_widget.dart';


class CustomIndenCard extends StatelessWidget {

  final User user ;

  const CustomIndenCard({Key? key, required this.user, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.8;
    double padding = MediaQuery.of(context).size.width * 0.07;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: height,
        width: double.infinity,
        decoration: cardBordes(),
        child: Stack(children: [

          Positioned(left: 0, child: Cargo(dato:user.role!)),

          Positioned(
              top: 5,
              right: 1,
              bottom: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  width: MediaQuery.of(context).size.width * 0.69,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25, left: 25, top: 5, bottom: 20),
                        child: Image.asset('assets/logo_background.png',
                            alignment: Alignment.center),
                      ),

                      SizedBox(
                          width: 165,
                          child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomProductImage(url: user.identificationPicture),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2, bottom: 5),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '${user.firstName} ${user.lastName}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                         const Text(
                                            'Sede:',
                                            style:  TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text('${user.campus}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              softWrap: true,
                                              maxLines: 3,
                                              overflow:
                                                  TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                    
                                    _CodigoQR(documento: user.identification.toString(), url: AppAssets.qrURL),

                              ]
                              )
                              
                              ),

                          
                                  Text(
                                      'CC:${user.identification}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                  ),

                           Column(
                           children: [
                             SizedBox(
                               height: 60,
                               
                               width: MediaQuery.of(context).size.width * 0.69,
                               child: ListView.builder(
                                       itemCount: user.programs?.length ?? 0,
                                       itemBuilder: (BuildContext context, int index) {
                                         return 
                                          Text(
                               user.programs?[index] ?? '',
                                 textAlign: TextAlign.center,

                               style: const TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,
                             );
                                       },),
                             ),
                           ],
                         ),

                    
                         Center(
                            child:  Column(
                              children: [
                                 
                                Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10),
              child: Container(
                color: AppAssets.primaryColor,
                height: 4,
                width: MediaQuery.of(context).size.width * 0.65,
              ),
            ),


  


                          const      Text('www.unicordoba.edu.co',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(115, 9, 46, 83))),
                              ],
                            )),
                      // )
                    ],
                  ))),
        ]),
      ),
    );
  }

  BoxDecoration cardBordes() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 3), blurRadius: 10)
          ]);
}

class _Encabezado extends StatelessWidget {
  final User usuario;

  const _Encabezado({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${usuario.firstName}',
                style: const  TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(' CC: ${usuario.identification!}',
                style: const  TextStyle(fontSize: 18, color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}

class _CodigoQR extends StatefulWidget {
  final String documento;
  final String url;

  const _CodigoQR({
    Key? key,
    required this.documento,
    required this.url,
  }) : super(key: key);

  @override
  State<_CodigoQR> createState() => _CodigoQRState();
}

class _CodigoQRState extends State<_CodigoQR> {
  late Timer timer;
  late String qr;

   // El temporizador

   @override
  void initState() {
    super.initState();
    // Iniciar el temporizador al cargar el widget
    String cadena = '${widget.documento}/${DateTime.now()}';
    String dato = cadena.replaceAll(' ', '/');
    String  encryption = EncryptionUtils.encryptString(dato);
   log(encryption);
       setState(() {
      qr =  '${widget.url}/$encryption';
      log(qr);
    });

    timer = Timer.periodic( const Duration(seconds: 20), (timer) {
        if (mounted) {
    setState(() {
    String cadena = '${widget.documento}/${DateTime.now()}';
    String dato = cadena.replaceAll(' ', '/');
    String  encryption = EncryptionUtils.encryptString(dato);
      qr =  '${widget.url}/$encryption';
    });
   }
    });
  }
  @override
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: QrImage(data: qr ));
  }


}

class _Foto extends StatelessWidget {
  final foto;
  const _Foto({
    Key? key,
    required this.foto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tamano = MediaQuery.of(context).size;
    String url =
        'https://thumbs.dreamstime.com/z/retrato-de-hombre-mirando-la-c%C3%A1mara-sobre-el-fondo-blanco-158750254.jpg';
    final url1 = null;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: SizedBox(
            height: 200,
            width: 200,
            child: CustomProductImage(url: foto)),
      ),
    );
  }
}

class Cargo extends StatelessWidget {
  final String dato;

   Cargo({
    Key? key,
  required this.dato,
  }) : super(key: key);

  late Color color;
  @override
  Widget build(BuildContext context) {

    return Container(
        // width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.16,
        decoration: _buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Align(
            alignment: Alignment.topCenter,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                dato,
                style: const TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ));
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
      color: AppAssets.primaryColor,
      borderRadius:  const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ));
}
