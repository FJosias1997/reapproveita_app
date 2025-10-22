import 'package:flutter/material.dart';
import 'package:reapproveita_app/extensions/context_extensions.dart';
import 'package:reapproveita_app/utils/bottom_curve_clipper.dart';

class DefaultHeroWidget extends StatelessWidget {
  final String? imageUrl;
  const DefaultHeroWidget({this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: BottomCurveClipper(),
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.network(
                  imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.white.withAlpha(3),
                    Colors.white12,
                    context.theme.scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
