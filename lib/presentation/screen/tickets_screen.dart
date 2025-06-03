import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/widget/empty_list.dart';
import 'package:ticketapp/presentation/widget/ticket_active_card.dart';

import '../../data/provider/ticket_provider.dart';
import '../../theme/app_colors.dart';
import 'buy_ticket/buy_ticket_screen.dart';

class TicketsScreen extends ConsumerStatefulWidget {
  const TicketsScreen({super.key});

  @override
  ConsumerState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends ConsumerState<TicketsScreen> {
  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: AppColors.primary,
                      tabs: [
                        Tab(text: _loc.active),
                        Tab(text: _loc.history),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _activeTicketList(),
                      _ticketBoughHistory()
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _activeTicketList(){
    final activeTickets = ref.watch(watchActiveTicketsProvider);
    return activeTickets.when(
        data: (tickets){
          if(tickets.isNotEmpty){
            return ListView.builder(
                itemCount: tickets.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  final ticket = tickets[index];
                  final baseTicketAsync = ref.watch(getTicketProvider(ticketId: ticket.ticketId));
                  return baseTicketAsync.when(
                    data: (baseTicket) {
                      if (baseTicket == null) return SizedBox.shrink();
                      return TicketActiveCard(ticket, baseTicket);
                    },
                    loading: () => SizedBox.shrink(),
                    error: (_, __) => SizedBox.shrink(),
                  );
                }
            );
          }else{
            return EmptyList(
                headline: _loc.noActiveTicketsHeadline,
                icon: Icons.airplane_ticket,
                buttonText: _loc.buyTicket,
                onTap: () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BuyTicket())));
          }
        },
        error: (error,st) => Text('Ups $error'),
        loading: () => Column(
          children: [
            Text('loading'), //TODO: usunac potem
            Center(child: CircularProgressIndicator()),
          ],
        )
    );
  }

  Widget _ticketBoughHistory(){
    final expiredTickets = ref.watch(watchExpiredTicketsProvider);
    return expiredTickets.when(
        data: (tickets){
          if(tickets.isNotEmpty){
            return ListView.builder(
                itemCount: tickets.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  final ticket = tickets[index];
                  final baseTicketAsync = ref.watch(getTicketProvider(ticketId: ticket.ticketId));
                  return baseTicketAsync.when(
                    data: (baseTicket) {
                      if (baseTicket == null) return SizedBox.shrink();
                      return TicketActiveCard(ticket, baseTicket);
                    },
                    loading: () => SizedBox.shrink(),
                    error: (_, __) => SizedBox.shrink(),
                  );
                }
            );
          }else{
            return EmptyList(headline: _loc.expiredTicketsInfo, icon: Icons.history);
          }
        },
        error: (error,_) => Text('Ups $error'),
        loading: () => Center(child: CircularProgressIndicator())
    );
  }
}
