import 'package:flutter/material.dart';
import 'package:wallpaper/Tabs_Page/messi_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/neymar_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/ronaldo_wallpaper.dart';

class football extends StatefulWidget {
  const football({super.key});

  @override
  State<football> createState() => _footballState();
}

class _footballState extends State<football> {
  String _selectedPlayer = 'Cristiano Ronaldo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DropdownButton در body
            DropdownButton<String>(
              underline: const Divider(color: Colors.transparent,),
              isExpanded: true,
              value: _selectedPlayer,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPlayer = newValue!;
                });
              },
              items: <String>['Cristiano Ronaldo', 'Lionel Messi', 'Neymar']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Divider(
                        color: Colors.white60,
                        thickness: 1,
                      )
                    ],
                  ),
                );
              }).toList(),
              dropdownColor: Colors.black,
              iconEnabledColor: Colors.white,
              style: const TextStyle(fontSize: 18, color: Colors.white60),
            ),
            const SizedBox(height: 20), // فاصله بین DropdownButton و ویجت بازیکن
            Expanded(child: _getPlayerWidget()), // نمایش ویجت بازیکن انتخاب شده
          ],
        ),
      ),
    );
  }
  // ویجت مناسب بازیکن را برمی‌گرداند
  Widget _getPlayerWidget() {
    switch (_selectedPlayer) {
      case 'Cristiano Ronaldo':
        return const ronaldoPage();
      case 'Lionel Messi':
        return const messiPage();
      case 'Neymar':
        return const neymarPage();
      default:
        return const Text('No Player Selected');
    }
  }
}

