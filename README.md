# Exemplo de ValueNotifier no Flutter para troca de tema

Este repositório demonstra o uso do `ValueNotifier` no Flutter para gerenciar o tema do aplicativo. O exemplo permite alternar entre o tema claro e escuro através de um `Switch`.

## 📂 Estrutura do Projeto

O projeto consiste em três arquivos principais:

- `main.dart`: Arquivo principal que inicializa o aplicativo e define o tema.
- `my_home_page.dart`: Widget da página inicial que contém o `Switch` para alternar o tema.
- `theme_controller.dart`: Classe `ThemeController` que gerencia o estado do tema com um `ValueNotifier`.

---

## 💻 Código

### `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:change_notifier_state/presentation/controllers/theme_controller.dart';
import 'package:change_notifier_state/presentation/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
```

Neste arquivo, o widget `ValueListenableBuilder` escuta as mudanças no `themeController`. Sempre que o valor do tema é alterado, o `MaterialApp` é reconstruído com o novo tema.

### `my_home_page.dart`

```dart

import 'package:flutter/material.dart';
import 'package:change_notifier_state/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Trocar tema do app"),
            ValueListenableBuilder(
              valueListenable: themeController,
              builder: (context, value, child) {
                return Switch(
                  value: value,
                  onChanged: (value) {
                    themeController.changeTheme();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


```

Aqui, outro `ValueListenableBuilder` escuta o `themeController` para atualizar o estado do `Switch`. Quando o `Switch` é alterado, o método `themeController.changeTheme()` é chamado.

### `theme_controller.dart`

```dart

import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<bool> {
  ThemeController() : super(false);

  void changeTheme() {
    value = !value;
  }
}


```

A classe `ThemeController` estende `ValueNotifier<bool>`. O valor booleano representa o tema atual (`true` para escuro, `false` para claro). O método `changeTheme()` inverte o valor atual do tema, notificando os ouvintes (`ValueListenableBuilder` no `main.dart` e `my_home_page.dart`).

## ℹ️ `Explicação`

O `ValueNotifier` é uma classe que armazena um valor e notifica seus ouvintes quando esse valor é alterado.

Neste exemplo, o `ThemeController` usa um `ValueNotifier<bool>` para armazenar o estado do tema. Os widgets `ValueListenableBuilder` escutam as mudanças no `ThemeController` e se reconstruem quando o tema é alterado, garantindo que a interface do usuário reflita o tema atual.
