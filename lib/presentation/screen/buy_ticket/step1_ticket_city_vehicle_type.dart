import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/provider/ticket_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../model/city.dart';
import '../../widget/list_shadow_tile.dart';
import 'choose_city.dart';

class TicketType extends ConsumerStatefulWidget {
  final City city;
  final void Function(String) onCategorySelected;
  const TicketType( this.city, this.onCategorySelected, {super.key});

  @override
  ConsumerState createState() => _TicketTypeState();
}

class _TicketTypeState extends ConsumerState<TicketType> {

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }
  @override
  Widget build(BuildContext context) {
    final vehicle = ref.watch(getVehicleListProvider(cityId: widget.city.id));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChooseCity(widget.city),

          Text(_loc.chooseCategory, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4.0),
          vehicle.when(
            data: (vehicleList) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: vehicleList.length,
                itemBuilder: (context, index) {
                  final vehicleType = vehicleList[index];
                  return ListShadowTile(
                    text: vehicleType.name,
                    onTap: () => widget.onCategorySelected(vehicleType.name),

                  );
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}
