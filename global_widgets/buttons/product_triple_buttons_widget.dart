import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/utils/shared_preferences_utils.dart';

class ProductTripleButtonsWidget extends StatelessWidget {
  final ProductModel produto;
  const ProductTripleButtonsWidget({required this.produto, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: context.width * 0.25,
          height: 50,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.inverseSurface,
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIcons.chatCenteredDots(),
              color: context.theme.colorScheme.onPrimary,
              size: 24,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final saveProduct = await SharedPreferencesUtils.addProduct(
              produto,
            );

            if (saveProduct == true) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Produto adicionado ao carrinho'),
                  ),
                );
              }
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao adicionar produto ao carrinho'),
                  ),
                );
              }
            }
          },
          child: Container(
            width: context.width * 0.25,
            height: 50,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onPrimaryFixedVariant,
            ),
            child: Center(
              child: PhosphorIcon(
                Icons.add_shopping_cart,
                color: context.theme.colorScheme.onPrimary,
                size: 24,
              ),
            ),
          ),
        ),
        Container(
          width: context.width * 0.5,
          height: 50,
          decoration: BoxDecoration(color: context.theme.colorScheme.primary),
          child: Center(
            child: Text(
              'Comprar Agora',
              style: TextStyle(
                color: context.theme.colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
