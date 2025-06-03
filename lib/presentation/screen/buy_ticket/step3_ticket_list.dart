import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/provider/ticket_provider.dart';
import '../../../model/city.dart';
import '../../../model/ticket_model.dart';
import '../../widget/list_shadow_tile.dart';

class TicketList extends ConsumerStatefulWidget {
  final City city;
  final int ticketCategoryId;
  final void Function(TicketM) onTicketSelected;
  const TicketList(this.city, this.ticketCategoryId, this.onTicketSelected, {super.key});

  @override
  ConsumerState createState() => _TicketListState();
}

class _TicketListState extends ConsumerState<TicketList> {
  @override
  Widget build(BuildContext context) {
    final tickets = ref.watch(getAvailableTicketsProvider(cityId: widget.city.id));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: tickets.when(
          data: (tickets) {
            final filteredTickets = tickets.where((ticket) => ticket.variantId == widget.ticketCategoryId).toList();
            return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredTickets.length,
                itemBuilder: (context,index){
                  final ticket = filteredTickets[index];
                  return ListShadowTile(
                    text: ticket.name,
                    ticket: ticket,
                    onTap: () => widget.onTicketSelected(ticket),
                  );

                }
            );},
          error:(error,stack) => Text('Blad $error'),
          loading: () => Center(child: CircularProgressIndicator())
      ),
    );
  }
}
