import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/fashion_item.dart';
import '../pages/detail_page.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int likeCount = 2300;

  final List<String> comments = [
    'Kombin çok güzel görünüyor.',
    'Çanta ve pantolon uyumu harika.',
  ];

  final TextEditingController commentController = TextEditingController();

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void openComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 18,
                bottom: MediaQuery.of(context).viewInsets.bottom + 18,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: SizedBox(
                        width: 42,
                        height: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFD5D5D5),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Yorumlar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ListView.separated(
                        itemCount: comments.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 17,
                                backgroundImage:
                                    AssetImage(AppData.userAvatar),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  comments[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: 'Yorum yaz...',
                              filled: true,
                              fillColor: const Color(0xFFF2F2F2),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: const Color(0xFFA56D47),
                          child: IconButton(
                            onPressed: () {
                              final text = commentController.text.trim();

                              if (text.isEmpty) return;

                              modalSetState(() {
                                comments.add(text);
                                commentController.clear();
                              });

                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void openDetail(FashionItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(item: item),
      ),
    );
  }

  String formatLikes(int value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
    return value.toString();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = AppData.fashionItems;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 14),
          buildDescription(),
          const SizedBox(height: 14),
          buildImageGrid(items),
          const SizedBox(height: 14),
          buildTags(),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFEAEAEA)),
          const SizedBox(height: 12),
          buildStats(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(AppData.userAvatar),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daisy',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '34 mins ago',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildDescription() {
    return const Text(
      'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temperament and is recommended to friends',
      style: TextStyle(
        fontSize: 13,
        color: Color(0xFF999999),
        height: 1.45,
      ),
    );
  }

  Widget buildImageGrid(List<FashionItem> items) {
    return SizedBox(
      height: 330,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => openDetail(items[0]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  items[0].mainImage,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => openDetail(items[1]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        items[1].mainImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => openDetail(items[2]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        items[2].mainImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTags() {
    return Row(
      children: [
        buildTag('# Louis vuitton'),
        const SizedBox(width: 10),
        buildTag('# Chloé'),
      ],
    );
  }

  Widget buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF8E8E8E),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildStats() {
    return Row(
      children: [
        const Icon(Icons.reply, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        const Text(
          '1.7k',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(width: 18),
        GestureDetector(
          onTap: openComments,
          child: Row(
            children: [
              const Icon(Icons.comment_outlined, size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                comments.length.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: toggleLike,
          child: Row(
            children: [
              Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                size: 22,
                color: isLiked ? Colors.red : Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                formatLikes(likeCount),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}