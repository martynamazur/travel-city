import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:ticketapp/model/payment_method.dart';
import 'package:ticketapp/presentation/widget/counter.dart';
import 'package:ticketapp/presentation/widget/payment_piker.dart';


import '../../data/provider/ticket_provider.dart';

import '../../model/city.dart';
import '../../model/ticket_model.dart';
import 'city_selection_screen.dart';

class BuyTicket extends ConsumerStatefulWidget {
  const BuyTicket({super.key});

  @override
  ConsumerState createState() => _BuyTicketState();
}

class _BuyTicketState extends ConsumerState<BuyTicket> {
  final _pageController = PageController();
  int _currentStep = 1;
  int _maxSteps = 5;

  late int _vehicleTypeId; //do filtrowania listy
  //late int _ticketCategoryId;
  int _ticketCategoryId = -1;
  late int _ticketId;

  late double _ticketPrice = 0.0;
  late TicketM _ticket ;



  @override
  void initState() {
    super.initState();

    _ticket = TicketM(
        id: 0,
        cityId: 0,
        vehicleTypeId: 0,
        variantId: 0,
        name: 'name',
        price: 0.0);


  }
  @override
  Widget build(BuildContext context) {
    final city = ref.watch(selectedCityProvider);

    if (city == null) {
      return Scaffold(
        body: SafeArea(child: _chooseCity(city))
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                LinearProgressBar(
                  maxSteps: _maxSteps,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: _currentStep,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.grey,

                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index){
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildTicketTypePiker(city), //city, vehicles
                      _buildTicketCategoryPiker(city.id),//regular,discounted ticket
                      _buildAvailableTicketList(city),// ticket list
                      PaymentPiker(ticket: _ticket),
                      //_buildPaymentPiker(),
                     // _buildActivation()
                    ],

                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _buildTicketTypePiker(City city) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _chooseCity(city),
        _buildVehicleTypePiker(city.id)
      ],
    );
  }

  Widget _chooseCity(City? city){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('City', style: TextStyle(fontSize: 18.0)),
        SizedBox(height: 8.0),
        OutlinedButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => CitySelectionScreen())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( city ==null ? 'Select city' : city.name),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(height:  16.0),
        Divider(),
      ],
    );
  }

  Widget _buildVehicleTypePiker(int cityId) {
    final vehicle = ref.watch(getVehicleListProvider(cityId: cityId)); // Uzyskujemy dostęp do danych

    return Column(
      children: [
        Text('Choose category', style: TextStyle(fontSize: 18.0)),
        vehicle.when(
          data: (vehicleList) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final vehicleType = vehicleList[index];
                return ListTile(
                  title: Text(vehicleType.name),
                  onTap: () {
                    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    setState(() {
                      _currentStep++;
                    });
                  },
                );
              },
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }

  //normalny,ulgowy
  Widget _buildTicketCategoryPiker(int cityId) {
    final categoryList = ref.watch(getTicketVariantsProvider(cityId: cityId));
    return Column(
      children: [
        categoryList.when(
          data: (ticketVariants) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: ticketVariants.length,
              itemBuilder: (context, index) {
                final ticketVariant = ticketVariants[index];
                return ListTile(
                  title: Text(ticketVariant.name),
                  onTap: (){
                    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    setState(() {
                      _ticketCategoryId = ticketVariant.id;
                      _currentStep++;
                    });
                  },
                );
              },
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }

  //Wszystkie dostepne bilety filtrowane po rodzaju normalnym lub ulgowym
  Widget _buildAvailableTicketList(City city) {
    final tickets = ref.watch(getAvailableTicketsProvider(cityId: city.id));
    return Column(
      children: [
        tickets.when(
            data: (tickets) {
              final filteredTickets = tickets.where((ticket) => ticket.id == _ticketCategoryId).toList();
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredTickets.length,
                  itemBuilder: (context,index){
                    final ticket = filteredTickets[index];
                    return ListTile(
                      title: Text(ticket.name),
                      onTap: (){
                        setState(() {
                          _ticketPrice =  ticket.price;
                          _ticketId = ticket.id;
                          _ticket = ticket;
                          _currentStep++;
                        });
                        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

                      },
                    );

                  }
              );},
            error:(error,stack) => Text('Blad $error'),
            loading: () => Center(child: CircularProgressIndicator())
        ),
      ],
    );


  }



  _buildActivation() {}


}

