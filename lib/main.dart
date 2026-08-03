import 'package:flutter/material.dart';

void main() {
  runApp(const VoicePartyApp());
}

class VoicePartyApp extends StatelessWidget {
  const VoicePartyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Voice Room',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String adminEmail = "hk03319915139s@gmail.com";
  final String easypaisaNum = "03319915139";
  final String jazzcashNum = "03499780098";
  
  int userCoins = 5000000;

  void buyCoins(double usdtAmount) {
    setState(() {
      userCoins += (usdtAmount * 5000000).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Party & Gifts'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Text('Coins: $userCoins 🪙')),
          )
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Admin Profile'),
            subtitle: Text('hk03319915139s@gmail.com'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Top Up via EasyPaisa'),
            subtitle: Text('Merchant: $easypaisaNum'),
            trailing: ElevatedButton(
              onPressed: () => buyCoins(1.0),
              child: const Text('Buy 5M Coins (1 USDT)'),
            ),
          ),
          ListTile(
            title: const Text('Top Up via JazzCash'),
            subtitle: Text('Merchant: $jazzcashNum'),
            trailing: ElevatedButton(
              onPressed: () => buyCoins(1.0),
              child: const Text('Buy 5M Coins (1 USDT)'),
            ),
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              itemCount: 300,
              itemBuilder: (context, index) {
                if (index == 299) {
                  return Card(
                    color: Colors.amber.shade900,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.brush, size: 40),
                        Text('Custom Gift', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('500 USDT'),
                      ],
                    ),
                  );
                }
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.card_giftcard, color: Colors.purpleAccent),
                      Text('Gift #${index + 1}'),
                      Text('${(index + 1) * 1000} Coins'),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
