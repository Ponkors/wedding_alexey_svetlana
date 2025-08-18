import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'dart:html' as html;
import '../constants/app_constants.dart';
import 'section_title.dart';
import '../utils/responsive.dart';

class RSVPSection extends StatefulWidget {
  const RSVPSection({super.key});

  @override
  State<RSVPSection> createState() => _RSVPSectionState();
}

class _RSVPSectionState extends State<RSVPSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _guestsController = TextEditingController();
  bool _isAttending = true;
  bool _needsTransfer = true;
  bool _isSubmitting = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  void submitViaForm(Map<String, String> fields) {
    final uri = Uri.parse(
      'https://script.google.com/macros/s/AKfycbyFr_Cd65PfHuSn_URa1E33JVxowDfNhMdXjHNh8NGzWyh0KECu37hBVxg9n8I4D5XDrg/exec',
    );

    final encodedData = fields.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');

    html.HttpRequest.request(
      uri.toString(),
      method: 'POST',
      sendData: encodedData,
      requestHeaders: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    ).then((response) {
      print('Форма успешно отправлена: ${response.responseText}');
      _resetForm();
    }).catchError((error) {
      print('Ошибка при отправке формы: $error');
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        submitViaForm({
          'name': _nameController.text,
          'phone': _phoneController.text,
          'guests': _guestsController.text,
          'isAttending': _isAttending.toString(),
          'transfer': _needsTransfer.toString(),
        });

        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Спасибо за ответ!'),
              backgroundColor: Color(AppConstants.primaryColorValue),
            ),
          );
          _formKey.currentState!.reset();
          setState(() {
            _isAttending = true;
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Произошла ошибка при отправке формы. Пожалуйста, попробуйте позже.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _nameController.clear();
      _phoneController.clear();
      _guestsController.clear();
      _isSuccess = false;
      _isAttending = true;
      _needsTransfer = true;
    });
  }

  // void _showError(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 600;
    final cardPadding = isSmallScreen ? 20.0 : 40.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(AppConstants.backgroundColorValue),
            const Color(AppConstants.backgroundColorValue).withOpacity(0.9),
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(width)),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: Responsive.contentMaxWidth(width)),
            child: Column(
              children: [
                const SectionTitle(
                  title: 'Подтвердите участие',
                  subtitle: 'Мы будем рады видеть вас на нашем торжестве',
                ),
                const SizedBox(height: 50),
                AnimatedSwitcher(
                  duration: 500.ms,
                  child: _isSuccess
                      ? _buildSuccessMessage()
                      : _buildRSVPForm(isSmallScreen, cardPadding),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRSVPForm(bool isSmallScreen, double padding) {
    return Container(
      width: isSmallScreen ? double.infinity : 600,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Форма ответа',
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Пожалуйста, заполните форму до 20 сентября',
              style: GoogleFonts.raleway(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            // Поле имени
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ваше имя',
                hintText: 'Иванов Иван Иванович',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              validator: (value) => value?.isEmpty ?? true
                  ? 'Пожалуйста, введите ваше имя'
                  : null,
            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),

            // Поле телефона
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                hintText: '29 123 45 67',
                prefixIcon: const Icon(Icons.phone_outlined),
                prefixText: '+375 ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Введите номер телефона';
                if (!RegExp(r'^\d{9}$').hasMatch(value!))
                  return 'Введите 9 цифр номера';
                return null;
              },
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),

            // Поле количества гостей
            TextFormField(
              controller: _guestsController,
              decoration: InputDecoration(
                labelText: 'Количество гостей',
                hintText: '2',
                prefixIcon: const Icon(Icons.people_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Укажите количество гостей';
                if (int.tryParse(value!) == null) return 'Введите число';
                return null;
              },
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),

            Text(
              'Вы придёте?',
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildAttendanceOption(
                    value: true,
                    icon: Icons.check_circle_outline,
                    label: 'С радостью!',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildAttendanceOption(
                    value: false,
                    icon: Icons.cancel_outlined,
                    label: 'Не смогу :(',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Выбор трансфера
            Text(
              'Трансфер:',
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: _isAttending ? Colors.grey[800] : Colors.grey[400],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildTransferOption(
                    value: true,
                    icon: Icons.directions_bus,
                    label: 'Нужен',
                    color: Colors.blue,
                    isEnabled: _isAttending,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildTransferOption(
                    value: false,
                    icon: Icons.directions_car,
                    label: 'За рулем',
                    color: Colors.orange,
                    isEnabled: _isAttending,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Кнопка отправки
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(AppConstants.primaryColorValue),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Подтвердить',
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0),
          ],
        ),
      ),
    ).animate().fadeIn().scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }

  Widget _buildAttendanceOption({
    required bool value,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _isAttending = value;
          // Если пользователь не может прийти, сбрасываем выбор трансфера
          if (!value) {
            _needsTransfer = false;
          }
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              _isAttending == value ? color.withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isAttending == value ? color : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: _isAttending == value ? color : Colors.grey),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.raleway(
                color: _isAttending == value ? color : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferOption({
    required bool value,
    required IconData icon,
    required String label,
    required Color color,
    required bool isEnabled,
  }) {
    return InkWell(
      onTap: isEnabled ? () => setState(() => _needsTransfer = value) : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isEnabled
              ? (_needsTransfer == value
                  ? color.withOpacity(0.1)
                  : Colors.grey[50])
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEnabled
                ? (_needsTransfer == value ? color : Colors.grey[300]!)
                : Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isEnabled
                  ? (_needsTransfer == value ? color : Colors.grey)
                  : Colors.grey[400],
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.raleway(
                color: isEnabled
                    ? (_needsTransfer == value ? color : Colors.grey)
                    : Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            'Спасибо за ответ!',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Мы сохранили ваши данные и будем рады видеть вас на нашем торжестве.',
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'До встречи!',
            style: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(AppConstants.primaryColorValue),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}
