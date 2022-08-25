import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({required this.selected, required this.onSelected, super.key});

  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        for (int index = 0; index < menus.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: SidebarMenuSingle(
              selected: selected == index,
              onPressed: () => onSelected(index),
              data: menus[index],
            ),
          ),
      ],
    );
  }

  static const menus = [
    SidebarMenuDetails(
      activeIcon: Icons.home,
      icon: Icons.home_outlined,
      label: "Dashboard",
    ),
    SidebarMenuDetails(
      activeIcon: Icons.card_giftcard,
      icon: Icons.card_giftcard_outlined,
      label: "Rewards",
    ),
    SidebarMenuDetails(
      activeIcon: Icons.list,
      icon: Icons.list_outlined,
      label: "Projects",
    ),
    SidebarMenuDetails(
      activeIcon: Icons.contacts,
      icon: Icons.contacts_outlined,
      label: "Contact Us",
    ),
  ];
}

class SidebarMenuDetails {
  final IconData activeIcon;
  final IconData icon;
  final String label;

  const SidebarMenuDetails({
    required this.activeIcon,
    required this.icon,
    required this.label,
  });
}

class SidebarMenuSingle extends StatelessWidget {
  const SidebarMenuSingle({
    required this.selected,
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool selected;
  final SidebarMenuDetails data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(
                (!selected) ? data.icon : data.activeIcon,
                size: 20,
                color: (!selected) ? Colors.green.shade500 : Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  data.label,
                  style: TextStyle(
                    color: (!selected) ? Colors.green.shade500 : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .8,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
