import 'package:chiptabbar/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChipTabBar extends StatelessWidget {
  const ChipTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'വിവർത്തകർ',
          style: GoogleFonts.anekMalayalam(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildChips(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return Consumer<WriterProvider>(
      builder: (context, writerProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                writerProvider.writers.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(
                      writerProvider.writers[index].name,
                      style: TextStyle(
                        color: writerProvider.selectedIndex == index
                            ? Colors.white
                            : Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    selected: writerProvider.selectedIndex == index,
                    selectedColor: Colors.blue[700],
                    backgroundColor: Colors.grey[200],
                    onSelected: (selected) {
                      if (selected) {
                        writerProvider.setSelectedIndex(index);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    return Consumer<WriterProvider>(
      builder: (context, writerProvider, child) {
        final writer = writerProvider.writers[writerProvider.selectedIndex];
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      writer.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error_outline, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  writer.name,
                  style: GoogleFonts.anekMalayalam(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  writer.bio,
                  style: GoogleFonts.anekMalayalam(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                   
                  ),
                ),
                const SizedBox(height: 24),
                if (writer.works.isNotEmpty)
                  _buildSection('കൃതികള്‍', writer.works),
                if (writer.translations.isNotEmpty)
                  _buildSection('വിവര്‍ത്തനങ്ങള്‍', writer.translations),
                if (writer.retellings.isNotEmpty)
                  _buildSection('പുനരാഖ്യാനം', writer.retellings),
                if (writer.family != null)
                  _buildTextSection('കുടുബം', writer.family!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.anekMalayalam(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                '• $item',
                style: GoogleFonts.anekMalayalam(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextSection(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.anekMalayalam(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4),
          child: Text(
            text,
            style: GoogleFonts.anekMalayalam(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
