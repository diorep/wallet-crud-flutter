import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_crud/repositories/user_repository.dart';

import 'view/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserRepository()),
      ],
      child: const App(),
    ),
  );
}
