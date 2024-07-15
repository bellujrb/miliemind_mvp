import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/extensions/build_context_utils.dart';

class ResultTable extends StatefulWidget {
  const ResultTable({super.key});

  @override
  State<ResultTable> createState() => _ResultTableState();
}

class _ResultTableState extends State<ResultTable> {
  final int rowsPerPage = 6;
  int currentPage = 0;

  final List<Map<String, String>> data = List.generate(1, (index) {
    return {
      'id': '#${index + 1}',
      'age': '6 anos',
      'date': '01 Dec 2023',
    };
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: context.mediaWidth * 0.9,
          decoration: BoxDecoration(
            color: const Color(0xFFFEFEFE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: context.mediaWidth * 0.9,
                  ),
                  child: DataTable(
                    headingRowColor:
                        WidgetStateProperty.all(const Color(0xFFF2F5FA)),
                    border: TableBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    dataRowHeight: 56,
                    headingRowHeight: 56,
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Identificador',
                        style: TextStyle(
                            color: Color(0xFF6E7D87),
                            fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Idade',
                        style: TextStyle(
                            color: Color(0xFF6E7D87),
                            fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Data',
                        style: TextStyle(
                            color: Color(0xFF6E7D87),
                            fontWeight: FontWeight.w600),
                      )),
                      DataColumn(
                          label: Text(
                        'Resultado',
                        style: TextStyle(
                            color: Color(0xFF6E7D87),
                            fontWeight: FontWeight.w600),
                      )),
                    ],
                    rows: _getCurrentPageRows(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildPaginationControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> _getCurrentPageRows() {
    int startIndex = currentPage * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;

    return data
        .sublist(startIndex, endIndex > data.length ? data.length : endIndex)
        .map((row) => _buildDataRow(row['id']!, row['age']!, row['date']!))
        .toList();
  }

  DataRow _buildDataRow(String id, String age, String date) {
    return DataRow(cells: [
      DataCell(Text(id,
          style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF2C3A4B)))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(age,
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF2C3A4B))),
      )),
      DataCell(Text(date,
          style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF2C3A4B)))),
      DataCell(TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFFF6384),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Modular.to.navigate("inventory_portage_data");
        },
        child: Text('Detalhes',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
      )),
    ]);
  }

  Widget _buildPaginationControls() {
    int totalPages = (data.length / rowsPerPage).ceil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  currentPage == index ? Color(0xFFFF6384) : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                currentPage = index;
              });
            },
            child: Text(
              '${index + 1}',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
