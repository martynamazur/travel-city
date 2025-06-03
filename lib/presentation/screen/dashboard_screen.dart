import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/data/provider/ticket_provider.dart';
import 'package:ticketapp/presentation/widget/secondary_button.dart';
import 'package:ticketapp/presentation/widget/ticket_active_card.dart';
import 'package:ticketapp/presentation/widget/ticket_card.dart';
import 'package:ticketapp/theme/app_text_style.dart';


import '../../l10n/app_localizations.dart';
import 'buy_ticket/buy_ticket_screen.dart';
import '../widget/most_bough_ticket_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardScreenState();

}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
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
          child:SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_loc.hello, style: AppTextStyles.headline),
                _buildYourTicketList(),
                _buildMostBought(),
                SizedBox(
                  width: double.infinity,
                  child: SecondaryButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket())),
                      text:_loc.buyTicket,
                )
                )],
            ),
          ) ),
    );
  }

  Widget _buildHeaderSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProfileInfo(),
        SizedBox(
            width: 180,
            height:180,
            child:Image.asset('assets/bus.png')
        ),
      ],
    );
  }
  Widget _buildProfileInfo(){
    return Row(
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Container(
            color: Colors.red,
          )
        ),
        Column(
          children: <Widget>[
            Text('0.00PLN'),
            IconButton(onPressed: (){}, icon: Icon(Icons.wallet))
          ],
        ),
      ],
    );
  }

  Widget _buildYourTicketList(){
    final activeTickets = ref.watch(watchActiveTicketsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_loc.yourTicket, style: AppTextStyles.subHeadline),
        SizedBox(height: 8.0),
        activeTickets.when(
            data: (tickets){
              if(tickets.isNotEmpty) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: tickets.length,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                    itemBuilder: (context, index) {
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

                    });
              }else{
                return _emptyList();
              }
            },
            error: (error,_) => Text(_loc.error),
            loading: () => CircularProgressIndicator())
      ],
    );
  }

  Widget _emptyList(){
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                width: 1.0,
                color: Color(0xFFE0E0E0)
            ),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.airplane_ticket_outlined,
                size: 64,
                color: Colors.grey[400],
              ),
              Text(_loc.yourActiveTickets),
              Text(_loc.addTicketInfo),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMostBought() {
    final ticketSummaryAsync = ref.watch(mostBoughtTicketProvider);

    return ticketSummaryAsync.when(
      data: (ticketSummary) {
        if (ticketSummary == null) {
          return SizedBox.shrink();
        }

        final fullTicketAsync = ref.watch(getTicketProvider(ticketId: ticketSummary.id));

        return fullTicketAsync.when(
          data: (fullTicket) {
            if (fullTicket == null) return SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_loc.mostBought),
                    TextButton( onPressed: ()
                    {
                      //TODO: spr co to
                    },
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MostBoughTicket()));
                    },child: Text(_loc.showAll))),
                  ],
                ),

                TicketCard(ticket: fullTicket)
              ],
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (e, _) => Text('${_loc.error}}: $e'),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text(' ${_loc.error}: $e'),
    );
  }

}

