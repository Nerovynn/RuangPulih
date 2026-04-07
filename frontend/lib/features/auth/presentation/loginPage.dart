import 'package:flutter/material.dart';

void main() {
  runApp(const RuangPulihApp());
}

class RuangPulihApp extends StatelessWidget {
  const RuangPulihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruang Pulih',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: const Color(0xFFEDE9E1),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3D5A52)),
      ),
      home: const LoginPage(),
    );
  }
}

// ── Warna utama ──────────────────────────────────────────────
class AppColors {
  static const bg = Color(0xFFEDE9E1);
  static const card = Color(0xFFF7F5F0);
  static const hero = Color(0xFF3D5A52);
  static const accentBg = Color(0xFFD6E5E0);
  static const text1 = Color(0xFF1C201E);
  static const text2 = Color(0xFF4E5552);
  static const text3 = Color(0xFF9AA09C);
  static const border = Color(0x1F3D5A52);
  static const border2 = Color(0x383D5A52);
}

// ── Login Page ───────────────────────────────────────────────
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscurePass = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Brand ──
              _buildBrand(),
              const SizedBox(height: 32),

              // ── Title ──
              const Text(
                'Selamat datang kembali',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text1,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Masuk untuk melanjutkan perjalananmu',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.text3,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),

              // ── Email Field ──
              _buildFieldLabel('Email'),
              const SizedBox(height: 6),
              _buildTextField(
                controller: _emailCtrl,
                hint: 'contoh@email.com',
                icon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),

              // ── Password Field ──
              _buildFieldLabel('Password'),
              const SizedBox(height: 6),
              _buildPasswordField(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Lupa password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.hero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // ── Login Button ──
              _buildPrimaryButton(label: 'Masuk', onTap: () {}),
              const SizedBox(height: 22),

              // ── Divider ──
              _buildDivider(),
              const SizedBox(height: 22),

              // ── Social Buttons ──
              _buildSocialButton(
                label: 'Lanjutkan dengan Google',
                iconAsset: 'G',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildSocialButton(
                label: 'Lanjutkan dengan Facebook',
                iconAsset: 'f',
                onTap: () {},
              ),
              const SizedBox(height: 32),

              // ── Footer ──
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // ── Brand Widget ──────────────────────────────────────────
  Widget _buildBrand() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.hero,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text('🌿', style: TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Ruang Pulih',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.text1,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Tempatmu untuk pulih & bertumbuh',
            style: TextStyle(fontSize: 12, color: AppColors.text3),
          ),
        ],
      ),
    );
  }

  // ── Field Label ───────────────────────────────────────────
  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.text2,
        letterSpacing: 0.3,
      ),
    );
  }

  // ── Text Field ────────────────────────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border2, width: 0.5),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14, color: AppColors.text1),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: AppColors.text3),
          prefixIcon: Icon(icon, size: 18, color: AppColors.text3),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  // ── Password Field ────────────────────────────────────────
  Widget _buildPasswordField() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border2, width: 0.5),
      ),
      child: TextField(
        controller: _passCtrl,
        obscureText: _obscurePass,
        style: const TextStyle(fontSize: 14, color: AppColors.text1),
        decoration: InputDecoration(
          hintText: 'Masukkan password',
          hintStyle: const TextStyle(fontSize: 14, color: AppColors.text3),
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            size: 18,
            color: AppColors.text3,
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscurePass = !_obscurePass),
            child: Icon(
              _obscurePass
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 18,
              color: AppColors.text3,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  // ── Primary Button ────────────────────────────────────────
  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.hero,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }

  // ── Divider ───────────────────────────────────────────────
  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.border2, thickness: 0.5)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'atau lanjutkan dengan',
            style: TextStyle(fontSize: 12, color: AppColors.text3),
          ),
        ),
        Expanded(child: Divider(color: AppColors.border2, thickness: 0.5)),
      ],
    );
  }

  // ── Social Button ─────────────────────────────────────────
  Widget _buildSocialButton({
    required String label,
    required String iconAsset,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.text1,
          side: const BorderSide(color: AppColors.border2, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              iconAsset,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.text2,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.text1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Footer ────────────────────────────────────────────────
  Widget _buildFooter() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Belum punya akun? ',
          style: const TextStyle(fontSize: 13, color: AppColors.text3),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Daftar sekarang',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.hero,
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
