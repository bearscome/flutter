import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/audio.dart';
import 'package:flutter_application_4/provider/audioProvider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({super.key});
  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  late AudioPlayer _player;
  late bool playStatus;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    _player = AudioPlayer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _player.setUrl(
          'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
          preload: false);
    });

    playStatus = _player.playing; // false니까 시작하기
    debugPrint('state init ${_player.playing}');
  }

  @override
  void dispose() async {
    super.dispose();
    await _player.stop();
    await _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    // bool getStatus = audioProvider.getStatus;
    // int getIndex = audioProvider.getIndex;
    // int itemLength = audioProvider.getLength;
    late AudioModelItem getCurrentData = audioProvider.getStatus
        ? audioProvider.getCurrentData
        : AudioModelItem.fromJson({
            'title': '테스트21',
            'url':
                'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
            'cover':
                'https://marketplace.canva.com/EAExV0mbYPo/1/0/1600w/canva-%EC%B2%AD%EB%A1%9D%EC%83%89-%EB%B0%A4%ED%95%98%EB%8A%98-%EC%88%B2-%ED%92%8D%EA%B2%BD%EC%9D%98-%EC%95%A8%EB%B2%94%EC%BB%A4%EB%B2%84-Dt8PoMSDErw.jpg'
          });

    void setPlayStatus() {
      debugPrint("setPlayStatus__player.playing ${_player.playing}");
      setState(() {
        playStatus = _player.playing;
      });
    }

    void tapPlay() async {
      debugPrint('state tab play butten ${_player.playing}');
      if (_player.playing) {
        debugPrint('state 음악이 켜져 있으므로 정지 ${_player.playing}');
        _player.pause(); // false로 변경 -> 시작

      } else {
        debugPrint('state 음악이 꺼저 있으므로 시작 ${_player.playing}');
        // 음악이 실행될 경우 밑의 함수가 안돼...
        _player.play(); // true로 변경 -> 멈추기
      }

      setPlayStatus();
    }

    void loadUrl() async {
      // playStatus = true; // 다음곡 진행 시 강제 적용
      _player.stop();
      _player.setUrl(getCurrentData.url, preload: false);
      setPlayStatus();
    }

    void next() async {
      debugPrint('next');
      audioProvider.next();
      loadUrl();
    }

    void prev() async {
      debugPrint('prev');
      audioProvider.prev();
      loadUrl();
    }

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: Column(
            children: [
              Consumer(
                builder: (context, value, child) {
                  return SizedBox(
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          prev();
                        } else if (details.primaryVelocity! < 0) {
                          next();
                        }
                      },
                      child: Image.network(
                        getCurrentData.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('error $error');
                          debugPrint('stackTrace $stackTrace');
                          return const Text('에러');
                          // Center(
                          //   child: CircularProgressIndicator(),
                          // );
                        },
                      ),
                    ),
                  );
                },
              ),
              Text(
                getCurrentData.title,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => prev(),
                    child: const Text('이전'),
                  ),
                  TextButton(
                    onPressed: () => tapPlay(),
                    // child: Text(playStatus ? '시작' : '멈추기'),
                    child: Text(playStatus ? '멈추기' : '시작'),
                    // child: Text(_player.playing ? '멈추기' : '시작'),
                  ),
                  TextButton(
                    onPressed: () => next(),
                    child: const Text('다음'),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
