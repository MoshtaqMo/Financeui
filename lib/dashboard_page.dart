import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2363),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2363),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hello Ali!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Welcome back', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_none, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('YOUR BALANCE', style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 8),
                const Text('\$41,379.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ActionButton(icon: Icons.send, label: 'Transfer'),
                    _ActionButton(icon: Icons.arrow_downward, label: 'Withdraw'),
                    _ActionButton(icon: Icons.trending_up, label: 'Invest'),
                    _ActionButton(icon: Icons.add, label: 'Top up'),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.insights, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(child: Text("Let's check your Financial Insight for the month of June!", style: TextStyle(color: Colors.white, fontSize: 13))),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                _TransactionTile(icon: Icons.play_circle_fill, color: Colors.red, title: 'Youtube', subtitle: 'Subscription Payment', amount: '-\$15.00', date: '16 May 2024'),
                _TransactionTile(icon: Icons.attach_money, color: Colors.green, title: 'Stripe', subtitle: 'Monthly Salary', amount: '+\$3,000', date: '15 May 2024'),
                _TransactionTile(icon: Icons.book, color: Colors.blue, title: 'Google Play', subtitle: 'E-book Purchase', amount: '-\$139.00', date: '14 May 2024'),
                _TransactionTile(icon: Icons.account_balance_wallet, color: Colors.purple, title: 'OVO', subtitle: 'Top Up E-Money', amount: '-\$180.00', date: '18 May 2024'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.2),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  const _TransactionTile({required this.icon, required this.color, required this.title, required this.subtitle, required this.amount, required this.date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(amount, style: TextStyle(color: amount.startsWith('+') ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
          Text(date, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
} 