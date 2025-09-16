import 'package:flutter/material.dart';

import '../utils/category_color.dart';
import '../viewmodels/history_view_model.dart';
import '../services/storage_service.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late final HistoryViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = HistoryViewModel(StorageService());
    _load();
  }

  Future<void> _load() async {
    await vm.load();
    if (mounted) setState(() {});
  }

  Future<void> _clear() async {
    await vm.clear();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tidligere undersøkelser'),
        actions: [
          IconButton(
            tooltip: 'Tøm historikk',
            icon: const Icon(Icons.delete_forever),
            onPressed: vm.items.isEmpty
                ? null
                : () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Tøm historikk?'),
                        content: const Text('Dette vil fjerne alle lagrede undersøkelser.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Avbryt')
                          ),
                          FilledButton(onPressed: () => Navigator.pop(context, true),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Tøm"),
                          ),
                        ],
                        backgroundColor: Colors.red[50],
                      ),
                    );
                    if (ok == true) await _clear();
                  },
          ),
        ],
      ),
      body: vm.items.isEmpty
          ? const Center(child: Text('Ingen undersøkelser lagret ennå.'))
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: vm.items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final s = vm.items[i];
                final c = categoryColor(s.category);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: c,
                    foregroundColor: Colors.white,
                    child: Text('${s.total}'),
                  ),
                  title: Text('NIHSS: ${s.total} – ${s.category}'),
                  subtitle: Text('${_fmt(s.completedAt)}  (startet ${_fmt(s.startedAt)})'),
                );
              },
            ),
    );
  }
}

String _fmt(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final hh = dt.hour.toString().padLeft(2, '0');
  final mm = dt.minute.toString().padLeft(2, '0');
  return '$d.$m.$y kl $hh:$mm';
}

