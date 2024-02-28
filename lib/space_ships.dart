/*import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uzay Gemisi Oyunu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double _shipX = 0;
  double _shipY = 0;
  double _bulletY = -10;
  double _enemyX = 0;
  double _enemyY = -10;
  int _score = 0;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _moveBullet();
        _moveEnemy();
        _checkCollision();
        if (_score >= 100) {
          _gameOver = true;
          timer.cancel();
          _showGameOverDialog();
        }
      });
    });
  }

  void _moveBullet() {
    if (_bulletY > -10) {
      setState(() {
        _bulletY -= 10;
      });
    }
  }

  void _moveEnemy() {
    if (_enemyY > MediaQuery.of(context).size.height) {
      _enemyX = Random().nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();
      _enemyY = -50;
    } else {
      setState(() {
        _enemyY += 5;
      });
    }
  }

  void _checkCollision() {
    if (_bulletY < _enemyY + 50 &&
        _bulletY > _enemyY - 50 &&
        _shipX < _enemyX + 50 &&
        _shipX > _enemyX - 50) {
      setState(() {
        _score += 10;
      });
      _bulletY = -10;
      _enemyX = Random().nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();
      _enemyY = -50;
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Oyun Bitti'),
          content: Text('Tebrikler! Skorunuz: $_score\nYeniden oynamak ister misiniz?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _gameOver = false;
                });
                startGame();
              },
              child: Text('Yeniden Oyna'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _gameOver = false;
                });
              },
              child: Text('Çıkış'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _bulletY = MediaQuery.of(context).size.height - 50;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _shipX += details.delta.dx;
            _shipY += details.delta.dy;
            if (_shipX < 0) _shipX = 0;
            if (_shipX > MediaQuery.of(context).size.width - 50) _shipX = MediaQuery.of(context).size.width - 50;
            if (_shipY < 0) _shipY = 0;
            if (_shipY > MediaQuery.of(context).size.height - 50) _shipY = MediaQuery.of(context).size.height - 50;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: _shipX,
              bottom: _shipY,
              child: Icon(Icons.airplanemode_active, size: 50),
            ),
            Positioned(
              left: _enemyX,
              top: _enemyY,
              child: Icon(Icons.brightness_1, size: 50, color: Colors.red),
            ),
            Positioned(
              left: _shipX + 20,
              bottom: _bulletY,
              child: Icon(Icons.arrow_upward, size: 30, color: Colors.blue),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Text(
                'Skor: $_score',
                style: TextStyle(fontSize: 20),
              ),
            ),
            if (_gameOver)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  } # İSTEDİĞİM GİBİ YAPAMADIM 
}*/

