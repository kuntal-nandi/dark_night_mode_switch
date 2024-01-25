import 'package:flutter/material.dart';
import 'package:language_change/components/common_button.dart';
import 'package:language_change/theme/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ThemeModeProvider>(
                builder: (context, themeModeProvider, child) {
              return DropdownButton(
                // Initial Value
                value: themeModeProvider.themeValue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: themeModeProvider.items.map((Mode items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.name),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (Mode? newValue) {
                  themeModeProvider.changeMode(newValue!);
                },
              );
            }),
            const SizedBox(
              height: 10,
            ),
            CommonButton(onPressed: () {}, buttonTitle: 'Accept'),
            CommonButton.disabledButton(
              buttonTitle: 'Accept',
              onPressed: () {},
            ),
            CommonButton.defaultButton(
              buttonTitle: 'Accept',
              onPressed: () {},
            ),
            CommonButton.hoverButton(
              buttonTitle: 'Accept',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
