import 'dart:collection';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class EquationsPadlock extends ListEqualPadlock<int> {
  LinkedHashMap<String, int> answers;

  EquationsPadlock({
    String equations = '''
    <p>
      <em>Tiens, il semble que la porte soit bloquée par un sortilège de mathématicus !</em>
    </p>
    <p>~</p>
    <p>
      <em>A</em>, <em>B</em>, <em>C</em> et <em>D</em> sont des nombres à un chiffre situés entre <em>1</em> et <em>9</em>.
      Les équations sont toutes vraies.
    </p>
    <ul style="text-align: left;">
      <li><em>A</em> + <em>C</em> = <em>D</em></li>
      <li><em>A</em> × <em>B</em> = <em>C</em></li>
      <li><em>C</em> - <em>B</em> = <em>B</em></li>
      <li><em>A</em> × 4 = <em>D</em></li>
    </ul>
    <p>
      <strong>Trouver <em>A</em>, <em>B</em>, <em>C</em> et <em>D</em>.</strong>
    </p>
    ''',
    LinkedHashMap<String, int>? answers,
    super.hint = const PadlockHint(title: 'Indice', minimumTriesBeforeShowing: 3, text: 'C = 6'),
  })  : answers = answers ??
            LinkedHashMap<String, int>.of({
              'A': 2,
              'B': 3,
              'C': 6,
              'D': 8,
            }),
        super(
          title: 'Equations mystère',
          unlockMessage: equations,
          validList: answers?.values.toList() ?? [2, 3, 6, 8],
          failedToUnlockMessage: 'Mince, la porte ne se déverrouille pas...',
        );
}

class EquationsPadlockDialog extends PadlockAlertDialog<EquationsPadlock> {
  const EquationsPadlockDialog({
    super.key,
    required super.padlock,
  });

  @override
  State<StatefulWidget> createState() => _EquationsPadlockDialogState();

  static EquationsPadlockDialog builder(BuildContext context, EscapeGame escapeGame, Padlock padlock) => EquationsPadlockDialog(padlock: padlock as EquationsPadlock);
}

class _EquationsPadlockDialogState extends PadlockAlertDialogState<EquationsPadlockDialog> {
  LinkedHashMap<String, TextEditingController> controllers = LinkedHashMap();

  @override
  void initState() {
    super.initState();
    for (String letter in widget.padlock.answers.keys) {
      controllers[letter] = TextEditingController();
    }
  }

  @override
  List<Widget> buildBody(BuildContext context) => [
        for (MapEntry<String, int> entry in widget.padlock.answers.entries)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextField(
              controller: controllers[entry.key],
              keyboardType: TextInputType.number,
              maxLength: entry.value.toString().length,
              decoration: InputDecoration(
                counterText: '',
                prefixIcon: HtmlWidget(
                  '<em>${entry.key}</em> =&nbsp;',
                  textStyle: const TextStyle(fontSize: 20),
                ),
                isDense: true,
                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
              style: const TextStyle(fontSize: 20),
              onSubmitted: (value) => tryUnlock(),
            ),
          ),
      ];

  @override
  dynamic getCode() => controllers.values.map((controller) => int.tryParse(controller.text) ?? 0).toList();

  @override
  void dispose() {
    for (TextEditingController controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
