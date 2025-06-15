import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/provider/buy_form_notifier.dart';
import '../../../data/provider/ticket_provider.dart';
import '../../../model/city.dart';
import '../../../model/ticket_model.dart';
import '../../widget/list_shadow_tile.dart';

class TicketList extends ConsumerStatefulWidget {
  final City city;
  const TicketList(this.city,  {super.key});

  @override
  ConsumerState createState() => _TicketListState();
}

class _TicketListState extends ConsumerState<TicketList> {
  @override
  Widget build(BuildContext context) {
    final tickets = ref.watch(getAvailableTicketsProvider(cityId: widget.city.id));
    final ticketCategoryId = ref.watch(buyFormNotifierProvider.select((form) => form.baseTicket.variantId));
    developer.log('Category Id $ticketCategoryId');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: tickets.when(
          data: (tickets) {
            final filteredTickets = tickets.where((ticket) => ticket.variantId == ticketCategoryId).toList();
            return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredTickets.length,
                itemBuilder: (context,index){
                  final ticket = filteredTickets[index];
                  developer.log('Ticket $ticket');
                  return ListShadowTile(
                    text: ticket.name,
                    ticket: ticket,
                    ticketCategoryId: ticket.variantId,
                    onTap: () => ref.read(buyFormNotifierProvider.notifier).updateBaseTicket(ticket)
                  );
                }
            );},
          error:(error,stack) => Text('Blad $error'),
          loading: () => Center(child: CircularProgressIndicator())
      ),
    );
  }
}
