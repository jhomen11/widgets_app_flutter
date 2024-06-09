import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});

}

  const appMenuItems = <MenuItem> [
    MenuItem(
        title: 'Botones',
        subTitle: 'Varios botones en Flutter',
        link: '/buttons',
        icon: Icons.smart_button_outlined),

    MenuItem(title: 'Tarjetas',
        subTitle: 'Varias tarjetas en Flutter',
        link: '/cards',
        icon: Icons.credit_card_outlined),

    MenuItem(title: 'Progress Indicators',
        subTitle: 'Generales y controlados',
        link: '/progress',
        icon: Icons.refresh_rounded),

    MenuItem(title: 'Snackbars y dialogos',
        subTitle: 'Indicadores en pantalla',
        link: '/snackbars',
        icon: Icons.info_outline),

    MenuItem(title: 'UI Controls',
        subTitle: 'Ui Controls en Flutter',
        link: '/ui-controls',
        icon: Icons.car_rental_outlined),

    MenuItem(title: 'App Tutorial',
        subTitle: 'App Tutorial en Flutter',
        link: '/app-tutorial',
        icon: Icons.school_outlined),
  ];