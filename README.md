# change_notifier_state

Um novo projeto Flutter.

## Introdução

Este projeto é um ponto de partida para uma aplicação Flutter que demonstra o uso de `ValueNotifier`.

## Como funciona o ValueNotifier

`ValueNotifier` é uma classe especial que estende `ChangeNotifier` e é usada para notificar ouvintes quando o valor armazenado muda. É útil para gerenciar estados simples em Flutter.

### Exemplo de Código

Aqui está um exemplo de como usar `ValueNotifier` no código deste repositório:

```dart
import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: ValueNotifierExample(),
        );
    }
}

class ValueNotifierExample extends StatelessWidget {
    final ValueNotifier<int> _counter = ValueNotifier<int>(0);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('ValueNotifier Example'),
            ),
            body: Center(
                child: ValueListenableBuilder<int>(
                    valueListenable: _counter,
                    builder: (context, value, child) {
                        return Text('Counter: $value');
                    },
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => _counter.value += 1,
                child: Icon(Icons.add),
            ),
        );
    }
}
```

Neste exemplo, `ValueNotifier<int>` é usado para gerenciar o estado do contador. O `ValueListenableBuilder` reconstrói o widget sempre que o valor do contador muda.

## Recursos Adicionais

Alguns recursos para ajudá-lo a começar se este for seu primeiro projeto Flutter:

- [Lab: Escreva seu primeiro app Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Exemplos úteis de Flutter](https://docs.flutter.dev/cookbook)

Para obter ajuda sobre como começar com o desenvolvimento Flutter, veja a
[documentação online](https://docs.flutter.dev/), que oferece tutoriais,
exemplos, orientações sobre desenvolvimento móvel e uma referência completa da API.
