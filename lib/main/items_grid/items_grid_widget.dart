import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/item_cell/item_cell_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_grid_model.dart';
export 'items_grid_model.dart';

class ItemsGridWidget extends StatefulWidget {
  const ItemsGridWidget({
    super.key,
    this.items,
  });

  final List<ItemRecord>? items;

  @override
  State<ItemsGridWidget> createState() => _ItemsGridWidgetState();
}

class _ItemsGridWidgetState extends State<ItemsGridWidget> {
  late ItemsGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsGridModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (context) {
            final itemsList = widget!.items?.toList() ?? [];

            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.54,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itemsList.length,
              itemBuilder: (context, itemsListIndex) {
                final itemsListItem = itemsList[itemsListIndex];
                return ItemCellWidget(
                  key: Key('Keypbp_${itemsListIndex}_of_${itemsList.length}'),
                  item: itemsListItem,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
