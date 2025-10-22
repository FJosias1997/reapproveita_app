import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/models/supermarket_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';

class HorizontalCarouselSupermarketsWidget extends StatefulWidget {
  final List<SupermarketModel> supermercados;
  const HorizontalCarouselSupermarketsWidget({
    required this.supermercados,
    super.key,
  });

  @override
  State<HorizontalCarouselSupermarketsWidget> createState() =>
      _HorizontalCarouselSupermarketsWidgetState();
}

class _HorizontalCarouselSupermarketsWidgetState
    extends State<HorizontalCarouselSupermarketsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 0.03),
        Text(
          'Supermercados',
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            scrollDirection: Axis.horizontal,
            itemCount: widget.supermercados.length,
            itemBuilder: (context, index) {
              return CircleAvatar(
                radius: 50,
                backgroundImage:
                    Image.network(
                      widget.supermercados[index].imageUrl,
                      fit: BoxFit.cover,
                    ).image,
              );
            },
          ),
        ),
      ],
    );
  }
}
