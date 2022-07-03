import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleScreen extends StatelessWidget {
  final bool showText;
  final Widget child;

  const TitleScreen({
    super.key,
    this.showText = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          FadeIn(
            delay: const Duration(milliseconds: 1000),
            duration: const Duration(milliseconds: 1000),
            child: Image.asset('assets/backgrounds/titlescreen.png'),
          ),
          if (showText)
            Positioned(
              top: 30,
              child: ElasticIn(
                delay: const Duration(milliseconds: 2500),
                child: GestureDetector(
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationVersion: 'v1.0.0',
                      applicationIcon: SvgPicture.asset(
                        'assets/icon.svg',
                        height: 60,
                      ),
                      applicationLegalese: "Copyright © 2022 Hugo Delaunay. Tous droits réservés.\nTous les graphismes ont été créés par upklyak.",
                    );
                  },
                  child: Image.asset('assets/titlescreen-text.png'),
                ),
              ),
            ),
          child,
        ],
      );
}
