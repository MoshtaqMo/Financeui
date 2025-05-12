import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Statistic', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: 'May 2024',
              underline: Container(),
              items: const [
                DropdownMenuItem(value: 'May 2024', child: Text('May 2024')),
                DropdownMenuItem(value: 'April 2024', child: Text('April 2024')),
              ],
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 140,
                                height: 140,
                                child: CircularProgressIndicator(
                                  value: 1.0,
                                  strokeWidth: 16,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D2363)),
                                  backgroundColor: Color(0xFFE5E3F3),
                                ),
                              ),
                              const Text(
                                '20,173.00',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const Positioned(
                                bottom: 32,
                                child: Text('TOTAL INCOME', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Income Breakdown', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            _BreakdownRow(label: 'Monthly Salary', value: '10,086.50', percent: '50%', color: Color(0xFF2D2363)),
            _BreakdownRow(label: 'Passive Income', value: '3,631.14', percent: '18%', color: Color(0xFFE5A4F3)),
            _BreakdownRow(label: 'Freelance', value: '3,429.41', percent: '17%', color: Color(0xFFB6A4F3)),
            _BreakdownRow(label: 'Side Business', value: '3,025.95', percent: '15%', color: Color(0xFFB6E3F3)),
          ],
        ),
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final String percent;
  final Color color;
  const _BreakdownRow({required this.label, required this.value, required this.percent, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Text(percent, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
} 