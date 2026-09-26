import 'package:flutter/material.dart';

import '../Models/book_model.dart';
import 'book_cover.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 210,
                height: 300,
                child: BookCover(book: book),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              book.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF54263A),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${book.author}  ·  ${book.year}",
              style: const TextStyle(color: Color(0xFF8A6877), fontSize: 15),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                ...List.generate(5, (index) {
                  final starValue = index + 1;
                  final icon = book.rating >= starValue
                      ? Icons.star_rounded
                      : book.rating >= starValue - 0.5
                      ? Icons.star_half_rounded
                      : Icons.star_border_rounded;
                  return Icon(icon, color: const Color(0xFFFFB300), size: 22);
                }),
                const SizedBox(width: 8),
                Text(
                  book.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Color(0xFF54263A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFE8CBD6)),
            const SizedBox(height: 12),
            _BookInfoRow(label: "Genre", value: book.genre),
            _BookInfoRow(label: "Penerbit", value: book.publisher),
            _BookInfoRow(label: "Tahun terbit", value: "${book.year}"),
            _BookInfoRow(
              label: "Jumlah halaman",
              value: "${book.pages} halaman",
            ),
            const SizedBox(height: 16),
            const Text(
              "Sinopsis",
              style: TextStyle(
                color: Color(0xFF54263A),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              style: const TextStyle(
                color: Color(0xFF684A58),
                height: 1.55,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.tonalIcon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text("Kembali ke Library"),
                style: FilledButton.styleFrom(
                  foregroundColor: const Color(0xFF9E3E68),
                  backgroundColor: const Color(0xFFF9DCE7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _BookInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF8A6877)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF54263A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
