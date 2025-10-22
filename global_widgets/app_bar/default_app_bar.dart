import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/pages/checkout/checkout_page.dart';
import 'package:reapproveita_app/pages/search/search_page_expanded_page.dart';
import 'package:reapproveita_app/strings/constants.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? deactivateSearch;
  final bool? deactivateTrailing;
  final Function(String)? onSearch;
  final String? queryValue;

  const DefaultAppBar({
    super.key,
    this.deactivateSearch,
    this.deactivateTrailing,
    this.title,
    this.onSearch,
    this.queryValue,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.queryValue != null) {
      controller.text = widget.queryValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title:
          widget.deactivateSearch == true
              ? GestureDetector(
                onTap: () {
                  context.goPush(
                    SeachPageExpandedPage(
                      initialQuery: widget.queryValue ?? '',
                    ),
                  );
                },
                child: Container(
                  width: context.width * 0.9,
                  decoration: BoxDecoration(
                    color: context.colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      widget.queryValue ?? AppConstants.searchLabel,
                      textAlign: TextAlign.start,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                ),
              )
              : TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // impede o label de subir

                  fillColor: context.colorScheme.inversePrimary,
                  constraints: const BoxConstraints(maxHeight: 40),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                  labelText: AppConstants.searchLabel,
                ),
                onChanged: widget.onSearch,
                controller: controller,
              ),

      centerTitle: true,
      actions:
          widget.deactivateTrailing == true
              ? null
              : [
                IconButton(
                  icon: PhosphorIcon(
                    PhosphorIcons.shoppingCartSimple(PhosphorIconsStyle.bold),
                  ),
                  tooltip: AppConstants.checkout,
                  onPressed: () {
                    context.goPush(CheckoutPage());
                  },
                ),
              ],
    );
  }
}
