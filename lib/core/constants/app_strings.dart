/// A centralized repository for all hardcoded strings in the app.
/// This replaces the need for the full localization setup for a single-language app.
abstract class AppStrings {
  // Private constructor to prevent instantiation
  AppStrings._();

  // General
  static const appTitle = 'PKP Hub';

  // Login Screen
  static const loginPageTitle = 'Masuk ke Akun Anda';
  static const emailAddressLabel = 'Alamat Email';
  static const emailAddressHint = 'nama@email.com';
  static const passwordLabel = 'Kata Sandi';
  static const passwordHint = 'Masukkan Kata Sandi';
  static const forgotPasswordButton = 'Lupa Kata Sandi?';
  static const loginButton = 'Masuk';
  static const notAMemberPrompt = 'Belum punya akun?';
  static const registerNowButton = 'Daftar Sekarang';

  // Register Screen
  static const registerPageTitle = 'Daftar';
  static const confirmPasswordLabel = 'Konfirmasi Kata Sandi';
  static const termsPrefix = 'Saya telah membaca dan menyetujui ';
  static const termsConditions = 'Syarat dan Ketentuan';
  static const termsAnd = ' dan ';
  static const privacyPolicy = 'Kebijakan Privasi';
  static const continueButton = 'Lanjutkan';

  // OTP / Confirmation
  static const otpConfirmPageTitle = 'Konfirmasi OTP';
  static const enterConfirmationCode = 'Masukkan kode konfirmasi';

  // use {email} as placeholder which callers should replace
  static const codeSentTo = 'Kode dikirim ke {email}';
  static const resendCode = 'Kirim ulang kode';

  // KYC Screen
  static const kycScreenTitle = 'Verifikasi Profil';
  static const kycFullNameLabel = 'Nama Lengkap';
  static const kycFullNameHint = 'Masukkan Nama Lengkap';
  static const kycPhoneNumberLabel = 'No. Handphone';
  static const kycPhoneNumberHint = '081234567890';
  static const kycAddressLabel = 'Alamat';
  static const kycAddressHint = 'Masukkan Alamat Lengkap';
  static const kycKtpNumberLabel = 'Nomer KTP';
  static const kycKtpNumberHint = '1234567890';
  static const kycUploadKtpLabel = 'Upload KTP';
  static const kycUploadSelfieKtpLabel = 'Upload Selfie KTP';

  // Create Project Screen
  static const landLocationTitle = 'Lokasi Lahan';
  static const projectNameLabel = 'Nama Proyek*';
  static const projectNameHint = 'Masukkan Nama Proyek';
  static const locationDetailsLabel = 'Detail Lokasi*';
  static const locationDetailsHint = 'Masukkan Detail Lokasi';
  static const typeLabel = 'Tipe*';
  static const typePrototype = 'Prototipe';
  static const typeNonPrototype = 'Non-Prototipe';
  static const landAreaLabel = 'Luas Lahan (m²)*';
  static const landAreaHint = '100';
  static const incomeLabel = 'Pendapatan';
  static const incomeHint = '123.456.789';
  static const incomeRequired = 'Pendapatan wajib diisi';
  static const incomeProofLabel = 'Bukti Pendapatan';
  static const incomeProofUploadButton = 'Unggah Bukti';

  // Create Project Validation
  static const projectNameRequired = 'Nama proyek wajib diisi';
  static const locationDetailsRequired = 'Detail lokasi wajib diisi';
  static const landAreaRequired = 'Luas lahan wajib diisi';

  // Validation messages (Bahasa Indonesia)
  // Template: use {field} where the field name will be inserted
  static const requiredFieldTemplate = '{field} wajib diisi';
  static const emailRequired = 'Email wajib diisi';
  static const emailInvalid = 'Silakan masukkan email yang valid';
  static const passwordRequired = 'Kata sandi wajib diisi';
  static const confirmPasswordRequired = 'Silakan konfirmasi kata sandi Anda';
  static const passwordsDoNotMatch = 'Kata sandi tidak cocok';
  static const phoneNumberRequired = 'Nomor telepon wajib diisi';
  static const phoneNumberInvalid = 'Silakan masukkan nomor telepon yang valid';

  // --- Bottom Navigation ---
  static const bottomNavHome = 'Beranda';
  static const bottomNavProject = 'Proyek';
  static const bottomNavProfile = 'Profil';

  // Error Messages
  static const errorTitle = 'Terjadi Kesalahan';
  static const loginFailedError =
      'Gagal masuk. Silakan periksa Email atau Kata Sandi anda dan coba lagi.';
  static const emptyCredentialsError =
      'Email dan kata sandi tidak boleh kosong.';
  static const serverError =
      'Terjadi kesalahan pada server. Silakan coba lagi nanti.';
  static const registrationFailed = 'Registrasi gagal. Silakan coba lagi.';
  static const noInternetConnection = 'Tidak terhubung ke jaringan internet.';

  // Home Menu Labels
  static const menuConsultation = 'Konsultasi';
  static const menuLicensing = 'Perizinan';
  static const menuMaterial = 'Material';
  static const menuConstruction = 'Konstruksi';
  static const menuFinancing = 'Pembiayaan';
  static const menuMonitoring = 'Pengawasan';
  static const homeFeatureMonitoring = 'Monitoring';
  static const homeFeatureSupervision = 'Pengawasan';
  static const homeFeatureChat = 'Chat';

  // HomeScreen Bottom Sheet
  static const chooseProjectTitle = 'Pilih Project';
  static const choose = 'Pilih';

  // HomeScreen Role Sections
  static const homeConsultantSectionTitle = 'Rekomendasi Konsultan';
  static const homeConsultantSeeAll = 'Lainnya';
  static const homeConsultantSectionSubtitle =
      'Pilih konsultan untuk memulai konsultasi proyek Anda';
  static const homeConsultantEmpty =
      'Belum ada konsultan yang dapat ditampilkan.';
  static const homeProjectsActiveTitle = 'Proyek Aktif';
  static const homeProjectsPendingTitle = 'Menunggu Konfirmasi';
  static const homeProjectsEmpty =
      'Belum ada proyek aktif atau menunggu konfirmasi.';

  // Permissions
  static const permissionDenied = 'Izin Ditolak';
  static const permissionPermanentlyDenied =
      'Anda telah menolak izin secara permanen. Silakan buka pengaturan aplikasi untuk mengaktifkannya.';
  static const cancel = 'Batal';
  static const openSettings = 'Buka Pengaturan';

  // Project Details Screen
  static const projectDetailsTitle = 'Detail Proyek';
  static const requestRevision = 'Minta Revisi';
  static const scheduleSurvey = 'Jadwalkan Survey';
  static const consultationTimelineEmpty =
      'Belum ada riwayat konsultasi untuk proyek ini.';
  static const consultationTimelineProjectInfo = 'Lihat Info Proyek';
  static const consultationTimelineDownloadHistory = 'Unduh Riwayat';
  static const consultationTimelineContractDownload = 'Unduh Kontrak';
  static const consultationTimelineDesignDownload = 'Unduh Dokumen Desain';
  static const roleConsultant = 'Konsultan';
  static const roleHomeowner = 'Pemilik Lahan';
  static const roleSystem = 'Sistem';
  static const roleUnknown = 'Pihak Terkait';
  static const projectInfoTitle = 'Informasi Proyek';
  static const projectInfoLocationLabel = 'Detail Lokasi';
  static const projectInfoCoordinateLabel = 'Koordinat';
  static const projectInfoCreatedAtLabel = 'Dibuat pada';
  static const projectInfoLocationEmpty = 'Lokasi proyek belum tersedia.';

  /// Consultant Portfolio Screen
  static const chatConsultant = 'Chat Konsultan';
  static const askForConsultation = 'Minta Konsultasi';

  // Generic actions / messages
  static const retryButton = 'Coba Lagi';
  static const unableToFetchLocation = 'Tidak dapat mendapatkan lokasi.';
  static const chooseFile = 'Pilih File';

  // Profile
  static const profileScreenTitle = 'Profil';

  // Consultant list
  static const consultantSortLabel = 'Urutkan berdasarkan';
}
