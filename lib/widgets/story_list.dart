import 'package:flutter/material.dart';
import '../data/app_data.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  void openStory(int index) {
    setState(() {
      AppData.stories[index].isViewed = true;
    });

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) {
        final story = AppData.stories[index];

        return Dialog(
          insetPadding: const EdgeInsets.all(14),
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  story.sharedImagePath,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.72,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 14,
                left: 14,
                right: 14,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(story.imagePath),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        story.brandName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: AppData.stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final story = AppData.stories[index];

          return GestureDetector(
            onTap: () => openStory(index),
            child: SizedBox(
              width: 72,
              child: Column(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: story.isViewed
                          ? null
                          : const LinearGradient(
                              colors: [
                                Color(0xFFFF003D),
                                Color(0xFFFF7A00),
                              ],
                            ),
                      border: story.isViewed
                          ? Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            )
                          : null,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(story.imagePath),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story.brandName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}