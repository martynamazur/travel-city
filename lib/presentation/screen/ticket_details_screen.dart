import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/model/activated_ticket_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/pick_amount_of_tickets.dart';

import '../../l10n/app_localizations.dart';
import '../../model/ticket_step_form.dart';
import '../widget/active_ticket_counter.dart';
import 'package:flutter/services.dart';




class TicketDetailsScreen extends ConsumerStatefulWidget {
  final ActivatedTicketAppModel activatedTicket;

  TicketDetailsScreen(this.activatedTicket, {super.key});

  @override
  ConsumerState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends ConsumerState<TicketDetailsScreen> {
  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  void initState() {
    super.initState();
    _setScreenBrightness(1.0);
    FlutterWindowManagerPlus.addFlags(FlutterWindowManagerPlus.FLAG_SECURE);

  }

  @override
  void dispose() {
    super.dispose();
    ScreenBrightness().resetApplicationScreenBrightness();
    FlutterWindowManagerPlus.clearFlags(FlutterWindowManagerPlus.FLAG_SECURE);

  }

  bool isExpired = false;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isExpired ? Colors.red : Colors.green, // kolor tła paska statusu
      statusBarIconBrightness: Brightness.light, // kolor ikon (light/dark)
    ));

    return Scaffold(
        bottomNavigationBar: isExpired ?  
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: OutlinedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => PickAmountOfTickets(ticket: widget.activatedTicket.baseTicket)));
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.black54),
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(_loc.buyAgain)
          ),
        ) : null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                //tło
                Container(
                  width: double.infinity,
                  height: 220,
                  color: isExpired ? Colors.red : Colors.green,
              ),
                Column(
                children: [
                  const SizedBox(height: 16.0),
                  //TODO znalezc enum i zmienic
                  Text(widget.activatedTicket.baseTicket.variantId.toString() ,style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
                  Text(''
                      '${widget.activatedTicket.baseTicket.name} '
                      '${widget.activatedTicket.baseTicket.minutes}MIN.',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold )
                  ),
                  const SizedBox(height: 16.0),
                  _buildQrSection(),
                  const SizedBox(height: 16.0),
                  Text('${_loc.ticketId}  ${widget.activatedTicket.transactionId}'),
                  const SizedBox(height: 16.0),
                  SizedBox(width:double.infinity,
                      child: CountdownTimer(
                        activatedAt: widget.activatedTicket.activatedAt!,
                        expiresAt: widget.activatedTicket.expiresAt!,
                        onExpireStatusChanged: (isExpired) {
                          if (isExpired) {
                            //zmiana wygladu
                          }
                        },
                      ),

                  ),
                  const SizedBox(height: 32.0),
                  _buildTicketStatus(),
                  _buildTicketPrice(),

                ],
                )
            ],
            )
          )
        )
    );
  }

  Widget _buildQrSection(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: 250,
              height: 250,
              child: QrImageView(data: widget.activatedTicket.token!)
          ),
        ),
      ),
    );
  }

  Widget _buildTicketStatus(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEEEEE),
              offset: Offset(0, 4),
              blurRadius: 8.6,
              spreadRadius: 0,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_loc.status),
                  Text(
                        isExpired ? _loc.expired : _loc.active,
                      style: TextStyle(color: isExpired ? Colors.red : Colors.green))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_loc.activeFrom),
                  Text('${DateFormat('dd.MM.yyyy').format(widget.activatedTicket.activatedAt!)}r'),
                  Text(DateFormat('HH:mm:ss').format(widget.activatedTicket.activatedAt!))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_loc.expiredAt),
                  Text('${DateFormat('dd.MM.yyyy').format(widget.activatedTicket.expiresAt!)}r'),
                  Text(DateFormat('HH:mm:ss').format(widget.activatedTicket.expiresAt!))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketPrice(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFEEEEEE),
                offset: Offset(0, 4),
                blurRadius: 8.6,
                spreadRadius: 0,
              )
            ]
        ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_loc.price),
                    Text(widget.activatedTicket.totalPrice.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_loc.ticketAmount),
                    Row(
                      children: [
                        Icon(Icons.people_outline_outlined, size: 20),
                        SizedBox(width: 4),
                        Text(widget.activatedTicket.amount.toString()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }



  Future<void> _setScreenBrightness(double brightness) async {
    try {
      await ScreenBrightness.instance.setApplicationScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to set system brightness';
    }
  }
  void updateExpiredStatus(bool value) {
    setState(() {
      isExpired = value;
    });
  }

  TicketStatus getTicketStatus() {
    final expiresAt = widget.activatedTicket.expiresAt;
    if (expiresAt == null) return TicketStatus.notActivated;
    if (expiresAt.isBefore(DateTime.now())) return TicketStatus.expired;
    return TicketStatus.valid;
  }

}
