import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List<Map<String, dynamic>> reminders = [
    {'medicine': 'Paracetamol', 'time': '07:00', 'dosis': '1 tablet'},
    {'medicine': 'Vitamin C', 'time': '12:00', 'dosis': '1 tablet'},
  ];

  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _dosisController = TextEditingController();
  TimeOfDay? _selectedTime;

  void _showAddDialog() {
    _medicineController.clear();
    _dosisController.clear();
    _selectedTime = null;
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Tambah Reminder"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _medicineController,
                  decoration: const InputDecoration(labelText: "Nama Obat"),
                ),
                TextField(
                  controller: _dosisController,
                  decoration: const InputDecoration(labelText: "Dosis"),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text("Waktu: "),
                    Text(
                      _selectedTime == null
                          ? "Pilih Jam"
                          : _selectedTime!.format(context),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text("Pilih"),
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() => _selectedTime = picked);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Batal"),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text("Simpan"),
                onPressed: () {
                  if (_medicineController.text.isEmpty ||
                      _dosisController.text.isEmpty ||
                      _selectedTime == null)
                    return;
                  setState(() {
                    reminders.add({
                      'medicine': _medicineController.text,
                      'time': _selectedTime!.format(context),
                      'dosis': _dosisController.text,
                    });
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  void _deleteReminder(int i) {
    setState(() {
      reminders.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminder Obat"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body:
          reminders.isEmpty
              ? const Center(child: Text("Belum ada reminder."))
              : ListView.separated(
                padding: const EdgeInsets.all(18),
                itemCount: reminders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final r = reminders[i];
                  return ListTile(
                    tileColor: const Color(0xFFF4F5F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      r['medicine'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Dosis: ${r['dosis']} • Jam: ${r['time']}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteReminder(i),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7FA893),
        child: const Icon(Icons.add),
        onPressed: _showAddDialog,
        tooltip: "Tambah Reminder",
      ),
    );
  }
}
