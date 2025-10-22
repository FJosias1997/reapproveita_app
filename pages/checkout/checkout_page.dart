import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reapproveita_app/data/models/product_model.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/global_widgets/app_bar/title_app_bar.dart';
import 'package:reapproveita_app/global_widgets/buttons/default_button_widget.dart';
import 'package:reapproveita_app/pages/payment/payment_page.dart';
import 'package:reapproveita_app/strings/constants.dart';
import 'package:reapproveita_app/utils/shared_preferences_utils.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<ProductModel> cartProducts = [];

  @override
  void initState() {
    super.initState();
    loadCheckoutFromSharedPrefs();
  }

  void loadCheckoutFromSharedPrefs() async {
    //await SharedPreferencesUtils.clearCart();
    await SharedPreferencesUtils.getProducts().then((value) {
      setState(() {
        cartProducts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: AppConstants.checkout),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              cartProducts.isNotEmpty
                  ? ListView.separated(
                    separatorBuilder:
                        (context, index) =>
                            const Divider(thickness: 0.2, color: Colors.grey),
                    shrinkWrap: true,
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          extentRatio: 0.30,
                          children: [
                            SlidableAction(
                              label: 'Delete',
                              backgroundColor: context.theme.colorScheme.error,
                              icon: Icons.delete,
                              onPressed: (context) {
                                SharedPreferencesUtils.removeProduct(
                                  cartProducts[index].id,
                                );
                                setState(() {
                                  cartProducts.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Image.network(
                            cartProducts[index].imageUrl,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            cartProducts[index].nome,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            "R\$ ${cartProducts[index].preco.toStringAsFixed(2)}",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ),
                      );
                    },
                  )
                  : const Center(child: Text('Nenhum item no carrinho')),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          cartProducts.isNotEmpty
              ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Text(
                          'Total: ',
                          style: context.theme.textTheme.bodyLarge,
                        ),
                        Text(
                          "R\$ ${cartProducts.map((e) => e.preco).reduce((value, element) => value + element).toStringAsFixed(2)}",
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      right: 4,
                      left: 4,
                      top: 16,
                    ),
                    child: DefaultButtonWidget(
                      title: 'Continuar',
                      width: context.width * 0.3,
                      height: 50,
                      onPressed: () {
                        context.goPush(
                          PaymentPage(
                            sum: cartProducts
                                .map((e) => e.preco)
                                .reduce((value, element) => value + element)
                                .toStringAsFixed(2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
              : const SizedBox(),
    );
  }
}
