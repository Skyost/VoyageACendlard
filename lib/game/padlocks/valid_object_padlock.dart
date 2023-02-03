import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voyage_a_cendlard/game/objects/sleeping_potion.dart';

class ValidObjectPadlock extends ObjectEqualPadlock<String> {
  ValidObjectPadlock({
    super.title = 'Un sommeil bien paisible',
    super.unlockMessage = '''
      <p>
        <em>Le professeur de mathématicus dort... Quel objet pourrait-on utiliser pour prolonger son sommeil ?</em>
      </p>
      <p>~</p>''',
    String validObjectId = SleepingPotion.objectId,
    super.failedToUnlockMessage = "Je ne pense pas que cela aura l'effet escompté.",
  }) : super(
          validObject: validObjectId,
        );
}

class ValidObjectPadlockDialog extends PadlockAlertDialog<ValidObjectPadlock> {
  final Inventory inventory;

  const ValidObjectPadlockDialog({
    super.key,
    required super.padlock,
    required this.inventory,
  });

  @override
  State<StatefulWidget> createState() => _ValidObjectPadlockDialogState();

  static ValidObjectPadlockDialog builder(BuildContext context, EscapeGame escapeGame, Padlock padlock) => ValidObjectPadlockDialog(
        padlock: padlock as ValidObjectPadlock,
        inventory: escapeGame.inventory,
      );
}

class _ValidObjectPadlockDialogState extends PadlockAlertDialogState<ValidObjectPadlockDialog> {
  String objectId = '';

  @override
  List<Widget> buildBody(BuildContext context) => [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              for (EscapeGameObject object in widget.inventory.objects)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      objectId = object.id;
                      tryUnlock();
                    },
                    child: Tooltip(
                      message: object.name,
                      child: SvgPicture.asset(
                        object.inventoryRenderSettings!.asset!,
                        height: 60,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ];

  @override
  dynamic getCode() => objectId;

  @override
  List<Widget> buildActions(BuildContext context) => [
    const EscapeGameAlertDialogCloseButton(),
  ];
}
