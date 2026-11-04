import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final String selectedPackage;
  final List<String> packages;
  final bool isDarkMode;

  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onPackageSelected;
  final ValueChanged<bool> onThemeChanged;

  const BookingControlsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.packages,
    required this.isDarkMode,
    required this.onDateSelected,
    required this.onPackageSelected,
    required this.onThemeChanged,
  });

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? today,
      firstDate: today,
      lastDate: DateTime(now.year + 2, 12, 31),
    );

    if (date != null) {
      onDateSelected(date);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Not selected';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking Preferences',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.calendar_month),
            title: const Text('Visit Date'),
            subtitle: Text(_formatDate(selectedDate)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _selectDate(context),
          ),

          const SizedBox(height: 12),
          const Text('Cruise Package'),
          const SizedBox(height: 8),

          DropdownButton<String>(
            isExpanded: true,
            value: selectedPackage,
            items: packages.map((packageName) {
              return DropdownMenuItem<String>(
                value: packageName,
                child: Text(
                  packageName,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                onPackageSelected(value);
              }
            },
          ),

          const SizedBox(height: 12),

          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
        ],
      ),
    );
  }
}