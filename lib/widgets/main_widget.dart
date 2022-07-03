import 'package:animate_do/animate_do.dart';
import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voyage_a_pastlard/widgets/title_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainWidget extends StatefulWidget {
  final EscapeGame escapeGame;

  const MainWidget({
    super.key,
    required this.escapeGame,
  });

  @override
  State<StatefulWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();
    for (String asset in [
      // 'assets/backgrounds/bedroom.png',
      // 'assets/backgrounds/bedroom-present.png',
      // 'assets/backgrounds/desk.png',
      // 'assets/backgrounds/living-room.png',
      // 'assets/glitch/image.webp',
    ]) {
      precacheImage(AssetImage(asset), context);
    }
    for (String asset in [
      // 'assets/interactables/arrow.svg',
      // 'assets/objects/eight-key.svg',
      // 'assets/objects/clover-key.svg',
      // 'assets/objects/mouth-key.svg',
      // 'assets/padlocks/caesar-1.svg',
      // 'assets/padlocks/caesar-2.svg',
    ]) {
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset), context);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Voyage à Pastlard',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scrollbarTheme: ScrollbarThemeData(thumbVisibility: MaterialStateProperty.all(true)),
        ),
        locale: const Locale('fr'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('fr')],
        home: EscapeGameWidget(
          baseSize: const Size(985.05, 396.31),
          backgroundColor: Colors.black,
          beforeGameStartBuilder: (context, escapeGame) => TitleScreen(
            child: Positioned(
              bottom: 60,
              child: ElasticIn(
                delay: const Duration(milliseconds: 3500),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                  ),
                  onPressed: escapeGame.start,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('JOUER'),
                ),
              ),
            ),
          ),
          afterGameFinishedBuilder: (context, escapeGame) => TitleScreen(
            showText: false,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.78),
              child: FadeIn(
                delay: const Duration(milliseconds: 2500),
                duration: const Duration(milliseconds: 1000),
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: '🪄 FÉLICITATIONS...?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      TextSpan(
                        text: '''\n~\n
La potion de sommeil a fait effet, et votre professeur de mathématicus ne s'est pas réveillé à temps pour l'interrogation.
Cependant, après investigation, le proviseur a constaté que vous vous étiez introduit dans son bureau et a ainsi découvert
toute votre machination... Vous avez donc été condammé à passer le reste de l'année en retenue pour travailler vos
mathématicus !''',
                      ),
                      TextSpan(
                        text: '\n\nIl faudra réviser la prochaine fois !',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          escapeGame: widget.escapeGame,
        ),
      );
}
