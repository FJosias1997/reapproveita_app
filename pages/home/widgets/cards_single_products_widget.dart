import 'package:flutter/material.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/pages/product_details/product_details_page.dart';
import 'package:reapproveita_app/strings/mockup_lists.dart';

class CardsSingleProductsWidget extends StatelessWidget {
  final List<ProductModel>? products;
  final int? maxItemsPerPage;
  const CardsSingleProductsWidget({
    this.maxItemsPerPage,
    this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 6,
        childAspectRatio: 0.75,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          maxItemsPerPage ?? products?.length ?? MockupLists.produtos.length,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              context.goPush(ProductDetailsPage(produto: products![index]));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8.0),
                          bottom: Radius.circular(8.0),
                        ),
                        image: DecorationImage(
                          image:
                              products?[index].imageUrl != null
                                  ? NetworkImage(products![index].imageUrl)
                                  : AssetImage(
                                        MockupLists.produtos[index]['imagem']
                                            as String,
                                      )
                                      as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      products?[index].nome ??
                          MockupLists.produtos[index]['nome'] as String,
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'R\$ ${products?[index].preco ?? MockupLists.produtos[index]['preco']}',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
