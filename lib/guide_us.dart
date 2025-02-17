// guide_provider.dart
import 'package:chiptabbar/constants/ColorClass.dart';
import 'package:chiptabbar/guideprovider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenPageState();
}

class _GuideScreenPageState extends State<GuideScreen> {
  final PageController _pageController = PageController();
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
  }

  void _initializeVideoPlayers() {
    _videoControllers = [
      VideoPlayerController.asset('assets/videos/welcome.mp4'),
      VideoPlayerController.asset('assets/videos/language.mp4'),
      VideoPlayerController.asset('assets/videos/settings.mp4'),
      VideoPlayerController.asset('assets/videos/translation.mp4'),
      VideoPlayerController.asset('assets/videos/interpretation.mp4'),
    ];

    for (var controller in _videoControllers) {
      controller.initialize().then((_) {
        controller.setLooping(true);
        controller.play();
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GuideProvider>(
      builder: (context, guideProvider, child) {
        return Scaffold(
          backgroundColor: guideProvider.isDarkMode ? ColorClass.darkGrey : ColorClass.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  guideProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: guideProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () => guideProvider.toggleTheme(),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    // Pause previous video
                    if (index > 0) {
                      _videoControllers[index - 1].pause();
                    }
                    if (index < _videoControllers.length - 1) {
                      _videoControllers[index + 1].pause();
                    }
                    // Play current video
                    _videoControllers[index].play();
                    guideProvider.setCurrentPage(index);
                  },
                  children: [
                    _buildGuidePage(
                      0,
                      'Welcome to Tafheem ul Quran',
                      'Start your journey of understanding the Quran',
                      guideProvider.isDarkMode,
                    ),
                    _buildGuidePage(
                      1,
                      'Language selection',
                      'Read verse by verse different languages',
                      guideProvider.isDarkMode,
                    ),
                    _buildGuidePage(
                      2,
                      'settings and preferences',
                      'Customize the app to your liking',
                      guideProvider.isDarkMode,
                    ),
                    _buildGuidePage(
                      3,
                      'translation and notes',
                      'Understand the Quran with translation and notes',
                      guideProvider.isDarkMode,
                    ),
                    _buildGuidePage(
                      4,
                      'interpretation and tafsir',
                      'Learn the Quran with interpretation and tafsir',
                      guideProvider.isDarkMode,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (guideProvider.currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Previous',
                          style: GoogleFonts.poppins(
                            color: guideProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 80),
                    DotsIndicator(
                      dotsCount: 5, // Changed from 3 to 5
                      position: guideProvider.currentPage.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: guideProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                        color: guideProvider.isDarkMode
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.3),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (guideProvider.currentPage < 4) { // Changed from 2 to 4
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Navigate to main app
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: Text(
                        guideProvider.currentPage < 4 ? 'Next' : 'Get Started', // Changed from 2 to 4
                        style: GoogleFonts.poppins(
                          color: guideProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGuidePage(
    int index,
    String title,
    String description,
    bool isDarkMode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 9 / 14,
            child: _videoControllers[index].value.isInitialized
                ? VideoPlayer(_videoControllers[index])
                : const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 24),
          Text(
            title,
             style: GoogleFonts.poppins(
            fontSize: 16,
            color: isDarkMode ? Colors.white70 : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.poppins(
            fontSize: 14,
            color: isDarkMode ? Colors.white70 : Colors.black87,
            fontWeight: FontWeight.w400,
          ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

