import 'package:flutter/material.dart';
import 'package:miva/core/services/notification_service.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TimeOfDay? selectedTime;

  void scheduleReminder() async {
    if (selectedTime == null) return;

    final now = DateTime.now();
    final scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    await NotificationService().showNotification(
      id: 1,
      title: "Saatnya Minum Obat",
      body: "Jangan lupa minum obat sesuai jadwal!",
      scheduledTime:
          scheduledDate.isAfter(now)
              ? scheduledDate
              : scheduledDate.add(const Duration(days: 1)),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Reminder berhasil diset!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminder Obat"),
        backgroundColor: const Color(0xFFA8D5BA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Atur Jam Pengingat Obat"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) setState(() => selectedTime = time);
              },
              child: Text(
                selectedTime == null
                    ? "Pilih Jam"
                    : "Jam: ${selectedTime!.format(context)}",
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: scheduleReminder,
              child: const Text("Set Reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
