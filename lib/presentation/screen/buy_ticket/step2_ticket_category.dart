import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/provider/buy_form_notifier.dart';
import '../../../data/provider/ticket_provider.dart';
import '../../../model/ticket_step_form.dart';
import '../../widget/list_shadow_tile.dart';

class TicketCategory extends ConsumerStatefulWidget {
  final int cityId;
  const TicketCategory(this.cityId, {super.key});

  @override
  ConsumerState createState() => _TicketCategoryState();
}

class _TicketCategoryState extends ConsumerState<TicketCategory> {
  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(getTicketVariantsProvider(cityId: widget.cityId));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          categoryList.when(
            data: (ticketVariants) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: ticketVariants.length,
                itemBuilder: (context, index) {
                  final ticketVariant = ticketVariants[index];
                  return ListShadowTile(
                    text: ticketVariant.name,
                    onTap: () {
                      ref.read(buyFormNotifierProvider.notifier).updateVariant(
                        variantId: ticketVariant.id,
                        variantName: ticketVariant.name,
                      );
                      //widget.onCategorySelected(ticketVariant.id, ticketVariant.name)
                    }
                  );
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}
