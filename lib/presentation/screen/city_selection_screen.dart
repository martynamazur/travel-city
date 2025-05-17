import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/provider/ticket_provider.dart';

class CitySelectionScreen extends ConsumerStatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  ConsumerState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends ConsumerState<CitySelectionScreen> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final cityList =  ref.watch(getCityListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose city'),
        actions: [
        ],
      ),
      body: SafeArea(
          child: cityList.when(
              data: (cityList) {
                return ListView.builder(
                    itemCount: cityList.length,
                    itemBuilder: (context,index){
                      final city = cityList[index];
                      return ListTile(
                        title: Text(city.name),
                        onTap: (){
                          ref.read(selectedCityProvider.notifier).state = city;

                          Navigator.pop(context);
                        },
                      );
                    }
                );
              },
              error: (error,st) => Text('$error'),
              loading: () => Center(child: CircularProgressIndicator(),))
      ),
    );
  }
}
