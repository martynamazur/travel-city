import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/data/provider/ticket_provider.dart';
import 'package:ticketapp/presentation/screen/ticket_details_screen.dart';

import '../../data/repository/qr_code_repository.dart';
import '../../l10n/app_localizations.dart';
import '../../model/princing_inf.dart';
import '../../model/ticket_model.dart';

class ActivateTicketScreen extends ConsumerStatefulWidget {
  final TicketM baseTicket;
  final PricingInf pricingInf;
  const ActivateTicketScreen(this.baseTicket,this.pricingInf ,{super.key});

  @override
  ConsumerState createState() => _ActivateTicketState();
}

class _ActivateTicketState extends ConsumerState<ActivateTicketScreen> {

  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 250,
    formats: [BarcodeFormat.qrCode],
    returnImage: false,
    torchEnabled: false,
    invertImage: false,
    autoZoom: false,
  );


  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_loc.activateTicketHeadline, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ),
              Expanded(
                child: MobileScanner(
                  controller: controller,
                  onDetect: (result) async {
                    final value = result.barcodes.first.rawValue;
                    final navigator = Navigator.of(context);
                    final messenger = ScaffoldMessenger.of(context);

                    if(value != null){
                      controller.stop();
                      final vehicleFleetId = handleScannedCode(value);
                      if(vehicleFleetId !=null){
                        final result = await ref.read(vehicleExistsProvider(vehicleFleetNumber: vehicleFleetId, cityId:  widget.baseTicket.cityId).future);

                        if(result.isValid){
                          final qrRepository = QrRepository();
                          final newActiveTicket = await qrRepository.activateTicket(
                              widget.baseTicket,
                              vehicleFleetId,
                              'transactionId wtf gdzie jest ',//TODO: mam to w modelu juz , pozmieniac
                              widget.pricingInf );

                          if(newActiveTicket != null){
                            final result = await ref.read(addActivatedTicketProvider(newActiveTicket).future);

                            //TODO: usunac pozniej
                            if (result == 1) {
                              developer.log('Rekord zostal wstawiony do db');
                            } else {
                              developer.log('Rekord NIE zostal wstawiony do db');
                            }

                            navigator.pushReplacement(MaterialPageRoute(builder: (_) => TicketDetailsScreen(newActiveTicket)));
                          }else{

                          }
                        }else{
                          messenger.showSnackBar(
                            SnackBar(content: Text(_loc.vehicleNotValidOrNotFound)));
                            controller.start();
                        }
                      }else{
                        messenger.showSnackBar(
                          SnackBar(content: Text(_loc.invalidQrCode)),
                        );
                          controller.start();
                      }
                    }
                  },
                ),
              )
            ],
          )
      ),
    );
  }

  String? handleScannedCode(String rawValue){
    try {
      final data = jsonDecode(rawValue);
      final vehicleId = data['ID'];
      developer.log('Zeskanowany numer taborowy: $vehicleId');
      return vehicleId;

    } catch (e) {
      return null;
    }
  }
}
