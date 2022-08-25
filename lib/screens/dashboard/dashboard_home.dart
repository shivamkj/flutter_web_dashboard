import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:web_dashboard/screens/dashboard/cooming_soon.dart';
import 'package:web_dashboard/screens/dashboard/dashboard.dart';

import '../../main.dart';
import '../../modals/user.dart';
import '../../utils/constants.dart';
import '../../widgets/sidebar_menu.dart';
import '../../widgets/responsive_builder.dart';
import '../../widgets/user_profile.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTab = 0;

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: ResponsiveBuilder.isDesktop(context)
          ? null
          : Drawer(
              child: SafeArea(
                child: SingleChildScrollView(child: _buildSidebar(context)),
              ),
            ),
      body: SafeArea(
        child: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTabContent(openDrawer: openDrawer),
                  _buildCalendarContent(),
                ],
              ),
            );
          },
          tabletBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: constraints.maxWidth > 800 ? 8 : 7,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _getTabContent(openDrawer: openDrawer),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const VerticalDivider(),
                ),
                Flexible(
                  flex: 4,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildCalendarContent(),
                  ),
                ),
              ],
            );
          },
          desktopBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 3 : 4,
                  child: _buildSidebar(context),
                ),
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 10 : 9,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _getTabContent(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const VerticalDivider(),
                ),
                Flexible(
                  flex: 4,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildCalendarContent(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getTabContent({VoidCallback? openDrawer}) {
    if (selectedTab == 0) {
      return DashBoard(onPressed: openDrawer);
    } else {
      return const CoomingSoon();
    }
  }

  Widget _buildSidebar(BuildContext context) {
    final userDetailsJsom = json.decode(App.preferences.getString(loginDetails)!);

    return ColoredBox(
      color: Colors.green.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: UserProfile(
              data: UserDetails.fromJson(userDetailsJsom),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SidebarMenu(
              selected: selectedTab,
              onSelected: (index) => setState(() => selectedTab = index),
            ),
          ),
          const Divider(
            indent: 20,
            thickness: 1,
            endIndent: 20,
            height: 60,
          ),
          const SizedBox(height: 20),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SidebarMenuSingle(
                selected: false,
                onPressed: () async {
                  await App.preferences.remove(isLoggedIn);
                  if (!mounted) return;
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                },
                data: const SidebarMenuDetails(
                  label: 'Logout',
                  activeIcon: Icons.logout,
                  icon: Icons.logout_outlined,
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "2021 Teamwork lisence",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarContent() {
    if (selectedTab == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(child: Text("Calendar", style: headerText)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month_rounded),
                  tooltip: "calendar",
                )
              ],
            ),
            const SizedBox(height: 20),
            // ...controller.taskGroup
            //     .map(
            //       (e) => _TaskGroup(
            //           title: DateFormat('d MMMM').format(e[0].date), data: e, onPressed: () {}),
            //     )
            //     .toList()
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  static const headerText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
}
