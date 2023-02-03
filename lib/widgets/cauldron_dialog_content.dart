import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:voyage_a_cendlard/game/objects/champinum_enigma.dart';
import 'package:voyage_a_cendlard/game/objects/enchanted_spices.dart';
import 'package:voyage_a_cendlard/game/objects/happiness_mirror.dart';
import 'package:voyage_a_cendlard/game/objects/hericorne_claw.dart';
import 'package:voyage_a_cendlard/game/objects/ingredient.dart';
import 'package:voyage_a_cendlard/game/objects/scaribo.dart';
import 'package:voyage_a_cendlard/game/objects/sleeping_potion.dart';

class CauldronDialogContent extends StatefulWidget {
  final Inventory inventory;

  const CauldronDialogContent({
    super.key,
    required this.inventory,
  });

  @override
  State<StatefulWidget> createState() => _CauldronDialogContentState();
}

class _CauldronDialogContentState extends State<CauldronDialogContent> {
  List<Ingredient> recipe = [];

  @override
  Widget build(BuildContext context) {
    List<Ingredient> ingredients = [];
    for (EscapeGameObject object in widget.inventory.objects) {
      if (object is Ingredient) {
        ingredients.add(object);
      }
    }

    if (ingredients.isEmpty) {
      return const Text(
        'Il faudrait des ingrédients pour utiliser cette marmite.',
        style: TextStyle(fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      );
    }

    SleepingPotion sleepingPotion = const SleepingPotion();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
          children: [
            for (Ingredient ingredient in ingredients)
              if (!recipe.contains(ingredient)) //
                _createDraggable(ingredient),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: ingredients.length - recipe.length == 0 ? 0 : 20, bottom: 20),
          child: HtmlWidget(
            '<div align="center">$description</div>',
            textStyle: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: DragTarget<Ingredient>(
                    onAccept: (ingredient) {
                      setState(() => recipe.add(ingredient));
                    },
                    builder: (context, candidateData, rejectedData) => Opacity(
                      opacity: candidateData.isNotEmpty ? 0.5 : 1,
                      child: SvgPicture.asset(
                        'assets/interactables/cauldron.svg',
                        height: 80,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 2,
                  spacing: 2,
                  children: [
                    for (Ingredient ingredient in recipe)
                      GestureDetector(
                        onTap: () {
                          setState(() => recipe.remove(ingredient));
                        },
                        child: IngredientWidget(
                          ingredient: ingredient,
                          height: 20,
                        ),
                      )
                  ],
                ),
              ],
            ),
            if (recipe.isNotEmpty)
              Transform.scale(
                scaleX: -1,
                child: SvgPicture.asset(
                  'assets/interactables/arrow-lobby.svg',
                  height: 50,
                ),
              ),
            if (recipe.isNotEmpty && !isRecipeGood)
              SvgPicture.asset(
                'assets/nothing.svg',
                height: 102,
              ),
            if (isRecipeGood)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    for (Ingredient ingredient in recipe) {
                      widget.inventory.removeObject(ingredient, notify: false);
                    }
                    widget.inventory.addObject(sleepingPotion);
                    Navigator.pop(context);
                  },
                  child: IngredientWidget(
                    ingredient: sleepingPotion,
                    height: 102,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  String get description {
    if (recipe.isEmpty) {
      return 'Commençons par ajouter des ingrédients dans le chaudron.';
    }

    if (isRecipeGood) {
      return "Cette recette donne une <strong>Potion de sommeil</strong>. Cliquez dessus pour l'ajouter à votre inventaire.";
    }

    return 'Cette recette ne donne rien.';
  }

  bool get isRecipeGood => setEquals(
        recipe.map((ingredient) => ingredient.id).toSet(),
        {
          ChampinumEnigma.objectId,
          EnchantedSpices.objectId,
          HericorneClaw.objectId,
          HappinessMirror.objectId,
          Scaribo.objectId,
        },
      );

  Widget _createDraggable(Ingredient ingredient) {
    IngredientWidget child = IngredientWidget(ingredient: ingredient);
    return Draggable<Ingredient>(
      data: ingredient,
      feedback: Opacity(
        opacity: 0.5,
        child: child,
      ),
      childWhenDragging: Opacity(
        opacity: 0,
        child: child,
      ),
      child: child,
    );
  }
}

class IngredientWidget extends StatelessWidget {
  final EscapeGameObject ingredient;
  final double height;

  const IngredientWidget({
    super.key,
    required this.ingredient,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: ingredient.name,
          child: SvgPicture.asset(
            ingredient.inventoryRenderSettings!.asset!,
            height: height,
          ),
        ),
      );
}
