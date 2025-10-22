import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/pages/product_details/product_details_page.dart';

class CarouselProductsWidget extends StatefulWidget {
  final List<ProductModel> produtos;
  const CarouselProductsWidget({required this.produtos, super.key});

  @override
  State<CarouselProductsWidget> createState() => _CarouselProductsWidgetState();
}

class _CarouselProductsWidgetState extends State<CarouselProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ofertas Imperdíveis',
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            viewportFraction: 0.9,
            autoPlay: false,
          ),
          items:
              widget.produtos.map((item) {
                // ⬅️ Agora iteramos sobre 'item'
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        context.goPush(ProductDetailsPage(produto: item));
                      },
                      child: Container(
                        // ⬅️ Container do item do carrossel
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ), // Margem aqui

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // Remover a margem interna, pois já está no Container pai
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8.0),
                                    bottom: Radius.circular(8.0),
                                  ),
                                  // 1. Usando item['imagem']
                                  image: DecorationImage(
                                    image:
                                        Image.network(
                                          item.imageUrl,
                                          fit: BoxFit.cover,
                                        ).image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            // SEÇÃO DA DESCRIÇÃO (NOME E PREÇO)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 2. Usando item['nome']
                                  Text(
                                    item.nome,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // 3. Usando item['preco']
                                  Text(
                                    'R\$ ${item.preco.toStringAsFixed(2)}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                      color:
                                          context
                                              .colorScheme
                                              .primary, // Cor de destaque para o preço
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
