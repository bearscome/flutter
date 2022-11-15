import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    init();
  }

  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var audioProvider = Provider.of<AudioProvider>(context, listen: false);
      await audioProvider.setInit();
      audioItems = audioProvider.getData;
      total = audioProvider.getLength;
    });
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, num> device = {
      "width": MediaQuery.of(context).size.width.round(),
      "height": MediaQuery.of(context).size.height.round(),
    };
    var audioProvider = Provider.of<AudioProvider>(context);
    void setIndex(index) => audioProvider.setIndex(index);

    if (scrollController.hasClients) {
      scrollController.animateTo(
        audioProvider.getIndex != 0
            ? device['width']! * 0.4 * audioProvider.getIndex
            : 0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 130,
          // height: device['height']! * 0.165,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: total,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => setIndex(index),
                child: Card(
                  color: Colors.blue,
                  child: SizedBox(
                    width: device['width']! * 0.4,
                    child: Column(
                      children: [
                        Text(
                          audioItems.isNotEmpty ? audioItems[index].title : "",
                        ),
                        Image.network(
                          audioItems.isNotEmpty ? audioItems[index].cover : "",
                          fit: BoxFit.cover,
                          height: 90,
                          // height: device['height']! * 0.12,
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
