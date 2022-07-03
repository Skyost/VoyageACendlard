import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';

class TextPadlock extends ObjectEqualPadlock<String> {
  TextPadlock({
    required super.title,
    required super.unlockMessage,
    required String answer,
    required super.failedToUnlockMessage,
  }) : super(
          validObject: answer.toLowerCase(),
        );

  @override
  bool isObjectValid(String object) => super.isObjectValid(object.toLowerCase());
}

class TextPadlockDialog extends PadlockAlertDialog<TextPadlock> {
  const TextPadlockDialog({
    super.key,
    required super.padlock,
  });

  @override
  State<StatefulWidget> createState() => _TextPadlockDialogState();

  static TextPadlockDialog builder(BuildContext context, EscapeGame escapeGame, Padlock padlock) => TextPadlockDialog(padlock: padlock as TextPadlock);
}

class _TextPadlockDialogState extends PadlockAlertDialogState<TextPadlockDialog> {
  TextEditingController controller = TextEditingController();

  @override
  List<Widget> buildBody(BuildContext context) => [
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            labelText: 'Entrer la réponse ici',
            icon: Icon(Icons.key),
          ),
          onSubmitted: (value) => tryUnlock(),
          autofocus: true,
        ),
      ];

  @override
  dynamic getCode() => controller.text;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
