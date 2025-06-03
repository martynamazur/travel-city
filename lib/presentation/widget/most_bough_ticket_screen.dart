import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/data/provider/ticket_provider.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/widget/ticket_card.dart';

import '../../data/service/database/app_database.dart';

class MostBoughTicket extends ConsumerWidget {
  const MostBoughTicket({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTickets = ref.watch(getUserMostBoughTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mostBoughTicketHeadline),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: allTickets.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (fullTickets) {
                  return ListView.builder(
                    itemCount: fullTickets.length,
                    itemBuilder: (context, index) {
                      final ticket = fullTickets[index];
                      return TicketCard(ticket: ticket);
                    },
                  );
                },
              ),
        )
    ));}}




