import 'package:flutter/material.dart';
import 'package:ticketapp/l10n/app_localizations.dart';

import '../../../model/city.dart';
import '../../widget/list_shadow_tile.dart';
import 'city_selection_screen.dart';

class ChooseCity extends StatefulWidget {
  final City? city;


  const ChooseCity(this.city, {super.key});

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  late final AppLocalizations _loc;
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_loc.city, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
          SizedBox(height: 8.0),
          ListShadowTile(
              icon: Icons.arrow_forward_ios,
              text: widget.city == null ? _loc.selectCity : widget.city?.name,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CitySelectionScreen()))
          ),
          SizedBox(height:  16.0),
        ],
      ),
    );
  }
}
