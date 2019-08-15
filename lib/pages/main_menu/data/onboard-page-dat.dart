import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/main_menu/model/main-menu-model.dart';

List<MainMenuModel> mainMenuListData = [
  MainMenuModel(
    Color(0xFFE6E6E6),
    Color(0xFF005699),
    'Stagger Animation',
    '/stagger',
    Icons.all_inclusive,
  ),
  MainMenuModel(
    Color(0xFF005699),
    Color(0xFFFFE074),
    'Music Player',
    '/music',
    Icons.music_note,
  ),
  MainMenuModel(
    Color(0xFFFFE074),
    Color(0xFF39393A),
    'Splash',
    '/splash',
    Icons.speaker_notes,
  ),
  MainMenuModel(
    Color(0xFF39393A),
    Color(0xFFE6E6E6),
    'Administrador',
    '/admin',
    Icons.add_to_home_screen,
  ),
  MainMenuModel(
    Color(0xFFE6E6E6),
    Color(0xFF005699),
    'Flutter Course',
    '/course',
    Icons.assignment,
  ),
  MainMenuModel(
    Color(0xFF005699),
    Color(0xFFFFE074),
    'Manager',
    '/manager',
    Icons.memory,
  ),
];