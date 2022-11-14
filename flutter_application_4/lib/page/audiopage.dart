import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/audio.dart';
import 'package:flutter_application_4/provider/audioProvider.dart';
import 'package:flutter_application_4/repository/audioRepository.dart';
import 'package:flutter_application_4/widget/audio_widget.dart';
import 'package:provider/provider.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  var audioRepository = AudioRepository();
  List<AudioModelItem> audioItems = [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await audioRepository.getAudioData();
    audioItems = audioRepository.getData;
    total = audioRepository.getTotal;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var audioProvider = Provider.of<AudioProvider>(context, listen: false);
      audioProvider.setData(audioItems);
      audioProvider.setTotal(total);
      audioProvider.setStatus();

      debugPrint('1');
    });
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    late List<AudioModelItem> getData = audioProvider.getData;
    int getIndex = audioProvider.getIndex;
    void setIndex(index) => audioProvider.setIndex(index);

    debugPrint('2');
    debugPrint('getData_getData $getIndex, $getData');
    debugPrint(
        'getData.length ${getData.isNotEmpty ? getData[getIndex].cover : []} ');

    return Column(
      children: [
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setIndex(index);
                },
                child: Card(
                  color: Colors.blue,
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        Text(getData.isNotEmpty ? getData[index].title : ""),
                        Image.network(
                          getData.isNotEmpty ? getData[index].cover : "",
                          fit: BoxFit.cover,
                          height: 90,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const AudioWidget(),
      ],
    );
  }
}
