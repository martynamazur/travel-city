import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/l10n/app_localizations.dart';

import '../../../data/provider/ticket_provider.dart';
import '../../widget/list_shadow_tile.dart';

class CitySelectionScreen extends ConsumerStatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  ConsumerState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends ConsumerState<CitySelectionScreen> {

  //TODO: zrobic wyszukiwarke, dodac alfabetyczny podzial w UI lub znalezc gotowa paczke
  String _query = '';
  late final AppLocalizations _loc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }
  @override
  Widget build(BuildContext context) {
    final cityList =  ref.watch(getCityListProvider);
    final choosenCity = ref.watch(selectedCityProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_loc.chooseCity),
        actions: [
        ],
      ),
      body: SafeArea(
          child: cityList.when(
              data: (cityList) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: cityList.length,
                      itemBuilder: (context,index){
                        final city = cityList[index];
                        return ListShadowTile(
                          text: city.name,
                          isSelected: choosenCity?.id == city.id ? true : false,
                          onTap: (){
                            ref.read(selectedCityProvider.notifier).state = city;
                            Navigator.pop(context);
                          },
                        );
                      }
                  ),
                );
              },
              error: (error,st) => Text('$error'),
              loading: () => Center(child: CircularProgressIndicator(),))
      ),
    );
  }
}
