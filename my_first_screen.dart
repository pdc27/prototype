import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of Thrones',
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => const HomeScreen(), // Tela inicial
        '/gameOfThrones': (context) =>
            const GameOfThronesScreen(), // Tela com SnackBar
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        // Usando Container ao invés de Center para aplicar a decoração
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/736x/0c/b2/62/0cb262238e6208b30cd2155ee54dfd67.jpg'),
            fit: BoxFit
                .cover, // Ajusta a imagem de fundo para cobrir toda a área
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter, // Posição do botão
          child: Padding(
            padding: const EdgeInsets.all(70.0), // Espaçamento
            child: ElevatedButton(
              onPressed: () {
                // Navega para a tela GameOfThronesScreen ao pressionar o botão
                Navigator.pushNamed(context, '/gameOfThrones');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'Choose your house!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GameOfThronesScreen extends StatefulWidget {
  const GameOfThronesScreen({super.key});

  @override
  State<GameOfThronesScreen> createState() => _GameOfThronesScreenState();
}

class _GameOfThronesScreenState extends State<GameOfThronesScreen> {
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    'https://i.pinimg.com/736x/03/9e/28/039e28fa7f9efab45bc0a7b7939aea0b.jpg',
    'https://upload.wikimedia.org/wikipedia/pt/e/e3/Tyrion-82837898.jpg',
    'https://i.pinimg.com/736x/4d/7a/c5/4d7ac5f7b48148d3650e6fb9ecadbcc6.jpg',
  ];

  final List<String> _snackBarMessages = [
    'Dracarys! - Daenerys Targaryen',
    'The Lannisters always pay their debts. - Tyrion Lannister',
    'Valar Morghulis! - Arya Stark',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Exibe o SnackBar usando o ScaffoldMessenger do contexto atual
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_snackBarMessages[index]),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.network(
          'https://i.pinimg.com/736x/1a/df/f4/1adff463347ef452a3e3f01a6d558248.jpg',
          height: 250,
          fit: BoxFit.contain,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 10, right: 10),
                child: const Text(
                  'If you play the Game of Thrones, you WIN or you DIE.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  _imageUrls[_currentIndex],
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                'https://i.pinimg.com/736x/46/fc/a4/46fca413db11e12ed67b3d731e2935d0.jpg',
                fit: BoxFit.cover,
              ),
            ),
            label: 'Targaryen',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                'https://i.pinimg.com/736x/85/e8/61/85e861a69eb567811f04c1024e401b54.jpg',
                fit: BoxFit.cover,
              ),
            ),
            label: 'Lannister',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                'https://i.pinimg.com/736x/43/34/84/4334848442ba5617568843de87a34d89.jpg',
                fit: BoxFit.cover,
              ),
            ),
            label: 'Stark',
          ),
        ],
      ),
    );
  }
}
