import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_test/counter_controller.dart';
import 'package:modal_test/modal_page.dart';

final counterProvider = SimpleProvider((ref) => CounterController());

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer(builder: (_, ref, __) {
        final ctrl = ref.watch(counterProvider);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${ctrl.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => showCupertinoModalBottomSheet(
              context: context,
              builder: (_) => const ModalPage(),
            ),
            tooltip: 'Increment',
            child: const Icon(Icons.open_in_new_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => counterProvider.read.updateCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
