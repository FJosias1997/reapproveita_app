import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/app_bar/transparent_app_bar.dart';
import 'package:reapproveita_app/global_widgets/buttons/product_triple_buttons_widget.dart';
import 'package:reapproveita_app/global_widgets/hero/default_hero_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel produto;
  const ProductDetailsPage({required this.produto, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBarWidget(isLeading: true, isTransparent: true),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultHeroWidget(imageUrl: produto.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Valor
                  Row(
                    children: [
                      Text(
                        'R\$',
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        produto.preco.toStringAsFixed(2),
                        style: context.theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Em até 2x de R\$ ${(produto.preco / 2).toStringAsFixed(2)}, sem juros',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  // Nome do produto
                  Text(
                    produto.nome,
                    style: context.theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Divider(
                    thickness: 1,
                    color: context.theme.colorScheme.onSurface.withValues(
                      alpha: .2,
                    ),
                  ),
                  Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.truck(),
                        color: context.theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text('Frete de R\$ 12,90 para todo o Brasil'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //Loja
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        produto.supermercado?.imageUrl ?? '',
                      ),
                    ),
                    title: Text(
                      produto.supermercado?.nome ?? 'Supermercado Desconhecido',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Avaliação: 3 ★'),
                    trailing: Text(
                      'Ver loja',
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Descrição
                  Text(
                    'Descrição',
                    style: context.theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    produto.descricaoProduto,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(child: ProductTripleButtonsWidget(produto: produto)),
        ],
      ),
    );
  }
}
