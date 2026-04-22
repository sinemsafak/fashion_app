import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../pages/detail_page.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 14),
          _buildDescription(),
          const SizedBox(height: 12),
          _buildImageGrid(context),
          const SizedBox(height: 12),
          _buildTags(),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFEAEAEA)),
          const SizedBox(height: 12),
          _buildBottomStats(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: const AssetImage(AppData.userAvatar),
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
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '34 mins ago',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.more_vert,
          color: Colors.grey,
          size: 20,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temperament and is recommended to friends',
      style: TextStyle(
        fontSize: 13.5,
        color: Color(0xFF9A9A9A),
        height: 1.45,
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context) {
    final images = AppData.postGridImages;

    return SizedBox(
      height: 245,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _goToDetail(context);
              },
              child: Hero(
                tag: images[0],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    images[0],
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                    onTap: () {
                      _goToDetail(context);
                    },
                    child: Hero(
                      tag: images[1],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          images[1],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _goToDetail(context);
                    },
                    child: Hero(
                      tag: images[2],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          images[2],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
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

  Widget _buildTags() {
    return Row(
      children: [
        _buildTag('# Louis vuitton'),
        const SizedBox(width: 10),
        _buildTag('# Chloé'),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9E9E9E),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBottomStats() {
    return Row(
      children: [
        const Icon(Icons.reply, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        const Text(
          '1.7k',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 18),
        const Icon(Icons.comment_outlined, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        const Text(
          '325',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const Icon(Icons.favorite, size: 20, color: Colors.red),
        const SizedBox(width: 4),
        const Text(
          '2.3k',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _goToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DetailPage(),
      ),
    );
  }
}