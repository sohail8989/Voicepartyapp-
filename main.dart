Voice Party Room & Gifting App Specification & Architecture
1. Project Overview & Requirements
This application is designed as an interactive Voice Party & Social Audio Streaming App focused strictly on fun,
engagement, and virtual gifting without cash withdrawal features.
● Primary Auth Account Admin Email: hk03319915139s@gmail.com
● EasyPaisa Direct Merchant / Receiving Account: 03319915139
● JazzCash Direct Merchant / Receiving Account: 03499780098
● Base Coin Economy: 1 USDT = 5,000,000 Coins
● Custom Gift Creation Fee: 500 USDT (2,500,000,000 Coins equivalent)
● Catalog Size: 300 Pre-loaded Virtual Gifts + Custom Gift Generator module.
2. System Architecture & Modules
Authentication Module
Integrates multi-provider OAuth logins via Firebase Authentication:
● Google Sign-In (Primary identity linked to hk03319915139s@gmail.com for admin rights)
● Phone Number OTP Verification (via Firebase SMS Gateway)
● TikTok Login Kit SDK Integration
● Twitter / X OAuth 2.0 Integration
Audio Engine & Party Rooms
Uses ZEGOCLOUD Express Audio / Agora RTC SDK for low-latency multi-seat voice channels (8-seat / 12-seat rooms)
with mic controls, background music (BGM), and real-time animation overlays.
Local Payment Integration Logic
Payment Note: Transactions via EasyPaisa (03319915139) and JazzCash (03499780098) pass through direct API webhook
verification or reference ID input to instantly credit user wallet with 5M coins per 1 USDT value.
3. Coin Economy & Gift Pricing Matrix
Tier Category Price Range (USDT) Coin Value Range Gift Examples
Basic Micro Gifts
(1-100)
0.0002 - 0.01 USDT 1,000 - 50,000 Coins Heart, Rose, Star,
Coffee, Lollipop Tier Category Price Range (USDT) Coin Value Range Gift Examples
Medium Party Gifts
(101-200)
0.1 - 5 USDT 500,000 - 25,000,000
Coins
Sports Car, Crown,
Fireworks, VIP Pass
Luxury Animated Gifts
(201-299)
10 - 100 USDT 50,000,000 -
500,000,000 Coins
Private Jet, Luxury
Yacht, Castle, Dragon
Custom User Gift (Gift
#300)
500 USDT 2,500,000,000 Coins User Custom
SVGA/PNG Asset
Creation
4. Core Flutter Code Implementation
Below is the main entry point logic demonstrating Auth configuration, Payment handlers, and Gift Engine setup.
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
int userCoins = 5000000; // Default 1 USDT worth of coins void buyCoins(double usdtAmount) {
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
