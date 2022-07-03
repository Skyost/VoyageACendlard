import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FindXPadlock extends Padlock<Offset> {
  final String asset;
  final Offset xOffset;

  FindXPadlock({
    String? title = "WANTED !",
    String? unlockMessage = '''
    <p>
      <em>Le professeur de mathématicus a protégé sa chambre par un sortilège d'énigme !</em>
    </p>
    <p>~</p>
    <p>Le triangle <em>ABC</em> ci-dessous est un triangle rectangle en <em>A</em> tel que <em>AB = 3</em> et <em>AC = 2</em>.</p>
    <p><strong>Trouver <em>x</em>.</strong></p>
    ''',
    String? failedToUnlockMessage = "Mince, ce n'est pas la bonne réponse !",
    this.asset = 'assets/padlocks/find-x.svg',
    this.xOffset = const Offset(120, 60),
  }) : super(
          title: title,
          unlockMessage: unlockMessage,
          failedToUnlockMessage: failedToUnlockMessage,
        );

  @override
  bool tryUnlock(Offset code) {
    if (Rect.fromCircle(center: xOffset, radius: 10).contains(code)) {
      unlock();
      return true;
    }
    return false;
  }
}

class FindXPadlockDialog extends PadlockAlertDialog<FindXPadlock> {
  const FindXPadlockDialog({
    Key? key,
    required FindXPadlock padlock,
  }) : super(
          key: key,
          padlock: padlock,
        );

  @override
  State<StatefulWidget> createState() => _FindXPadlockDialogState();

  static FindXPadlockDialog builder(BuildContext context, EscapeGame escapeGame, Padlock padlock) => FindXPadlockDialog(padlock: padlock as FindXPadlock);
}

class _FindXPadlockDialogState extends PadlockAlertDialogState<FindXPadlockDialog> {
  Offset previousOffset = Offset.zero;

  @override
  List<Widget> buildBody(BuildContext context) => [
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTapUp: (details) {
              previousOffset = details.localPosition;
              tryUnlock();
            },
            child: Stack(
              children: [
                Positioned(
                  top: widget.padlock.xOffset.dy - 15,
                  left: widget.padlock.xOffset.dx - 5,
                  child: const Text(
                    'x',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  ),
                ),
                SvgPicture.asset(widget.padlock.asset),
              ],
            ),
          ),
        ),
      ];

  @override
  dynamic getCode() => previousOffset;

  @override
  List<Widget> buildActions(BuildContext context) => [
    const EscapeGameAlertDialogCloseButton(),
  ];
}
