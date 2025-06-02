import 'package:flutter/material.dart';

// PUBLIC_INTERFACE
void main() {
  runApp(const MyApp());
}

/// PUBLIC_INTERFACE
/// The root widget of the 2048 WebMaster app. Sets up app-wide theme and home.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048 WebMaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color(0xFFfaf8ef), // primary background
          primary: Color(0xFFbbada0), // grid background
          secondary: Color(0xFFf67c5f), // accent color
        ),
        scaffoldBackgroundColor: const Color(0xFFfaf8ef),
        useMaterial3: true,
      ),
      home: const MainContainer(),
    );
  }
}

/// PUBLIC_INTERFACE
/// The main container widget for the 2048 game. Includes score display, grid, and restart button.
class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme colors
    final bgColor = Theme.of(context).colorScheme.background;
    final gridColor = Theme.of(context).colorScheme.primary;
    final accentColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: gridColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          '2048',
          style: TextStyle(
            color: Color(0xFFfaf8ef),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Score and Best
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Score box
                  _ScoreBox(label: "Score", value: 0),
                  // Spacer
                  SizedBox(width: 10),
                  // Best box
                  _ScoreBox(label: "Best", value: 0),
                ],
              ),
              const SizedBox(height: 30),
              // Grid Placeholder
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: gridColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: _GridPlaceholder(),
                ),
              ),
              const SizedBox(height: 30),
              // Restart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(accentColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 16)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {}, // Placeholder, will implement logic later
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// PRIVATE
/// A placeholder widget for the 4x4 grid.
class _GridPlaceholder extends StatelessWidget {
  const _GridPlaceholder();

  @override
  Widget build(BuildContext context) {
    // Build a 4x4 empty grid with subtle tile background.
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (row) => Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (col) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// PRIVATE
/// A box widget for displaying Score or Best labels and values.
class _ScoreBox extends StatelessWidget {
  final String label;
  final int value;
  const _ScoreBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFbbada0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFFfaf8ef),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
