import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart' as material;
import '../shared.dart';

class AdaptiveNavigation extends StatelessWidget {
  AdaptiveNavigation(
      {super.key,
      required this.destinations,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.child,
      required this.loginInfo});
  LoginInfo loginInfo;
  final List<material.NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        // Tablet Layout
        if (dimens.maxWidth >= 600) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: dimens.maxWidth >= 800,
                  minExtendedWidth: 180,
                  destinations: destinations
                      .map((e) => NavigationRailDestination(
                            icon: e.icon,
                            label: Text(e.label),
                          ))
                      .toList(),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                  trailing: Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextButton.icon(
                          icon: const Icon(Icons.exit_to_app),
                          onPressed: () async {
                            //TODO
                            await loginInfo.logout().then((value) {
                              context.goNamed('login');
                            });
                          },
                          label: const Text("Log out"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          );
        }
        // Mobile Layout
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: destinations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        );
      },
    );
  }
}
