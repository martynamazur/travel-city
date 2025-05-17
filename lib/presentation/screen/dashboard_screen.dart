import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/data/provider/ticket_provider.dart';
import 'package:ticketapp/presentation/widget/ticket_active_card.dart';
import 'package:ticketapp/presentation/widget/ticket_card.dart';
import 'package:ticketapp/presentation/screen/ticket_details_screen.dart';


import '../widget/active_ticket_counter.dart';
import 'buy_ticket_screen.dart';
import 'most_bough_ticket_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardScreenState();

}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProfileInfo(),
                    SizedBox(
                        width: 180,
                        height:180,
                        child:Image.asset('assets/bus.png')
                    ),
                  ],
                ),

                Text('Hello there',style: TextStyle(fontSize: 24)),
                SizedBox(height: 32.0),

                _buildYourTicketList(),
                SizedBox(height: 16.0),
                _buildMostBought(),
                SizedBox(height:16.0),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket())),
                      child: Text('Buy ticket')),
                )
              ],
            ),
          ) ),
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
    final userTickets = ref.watch(getUserTicketsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your ticket'),
        userTickets.when(
            data: (tickets){
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: tickets.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index){
                    final ticket = tickets[index];
                    return TicketActiveCard(ticket);
                  }
                  );
            },
            error: (error,st) => Text('Error'),
            loading: () => CircularProgressIndicator())
      ],
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
                    Text('Most bought'),
                    TextButton( onPressed: ()
                    {

                    },
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MostBoughTicket()));
                    },child: Text('Show all'))),
                  ],
                ),

                TicketCard(ticket: fullTicket)
              ],
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (e, _) => Text('Błąd: $e'),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('Błąd: $e'),
    );
  }

}

