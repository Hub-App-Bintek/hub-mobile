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
  static const forgotPasswordTitle = 'Lupa Kata Sandi';
  static const forgotPasswordSubtitle =
      'Masukkan email terdaftar untuk menerima kode reset kata sandi.';
  static const sendOtpButton = 'Kirim Kode';
  static const resetPasswordTitle = 'Atur Ulang Kata Sandi';
  static const newPasswordLabel = 'Kata Sandi Baru';
  static const newPasswordHint = 'Masukkan kata sandi baru';
  static const confirmNewPasswordLabel = 'Konfirmasi Kata Sandi Baru';
  static const resetPasswordButton = 'Simpan Kata Sandi';
  static const resetPasswordSuccess =
      'Kata sandi berhasil diperbarui. Silakan masuk kembali.';

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
  static const kycPhoneNumberHint = '81234567890';
  static const kycAddressLabel = 'Alamat';
  static const kycAddressHint = 'Masukkan Alamat Lengkap';
  static const kycKtpNumberLabel = 'Nomer KTP';
  static const kycKtpNumberHint = '1234567890';
  static const kycUploadKtpLabel = 'Upload KTP';
  static const kycUploadSelfieKtpLabel = 'Upload Selfie KTP';

  // Create Project Screen
  static const landLocationTitle = 'Detail Lokasi';
  static const projectNameLabel = 'Nama Proyek*';
  static const projectNameHint = 'Masukkan Nama Proyek';
  static const provinceLabel = 'Provinsi*';
  static const provinceHint = 'Pilih Provinsi';
  static const cityLabel = 'Kabupaten/Kota*';
  static const cityHint = 'Pilih Kabupaten/Kota';
  static const subdistrictLabel = 'Kecamatan*';
  static const subdistrictHint = 'Pilih Kecamatan';
  static const villageLabel = 'Kelurahan*';
  static const villageHint = 'Pilih Kelurahan';
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
  static const provinceRequired = 'Provinsi wajib dipilih';
  static const cityRequired = 'Kabupaten/Kota wajib dipilih';
  static const subdistrictRequired = 'Kecamatan wajib dipilih';
  static const villageRequired = 'Kelurahan wajib dipilih';
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
  static const bottomNavProject = 'Proyek Saya';
  static const bottomNavProfile = 'Profil';
  static const designTypeTitle = 'Konsultasi Desain';
  static const designTypeNonPrototypeTitle = 'Desain Non Prototype';
  static const designTypePrototypeTitle = 'Desain Prototype';
  static const designTypeNonPrototypeSubtitle =
      'Melakukan konsultasi desain dengan arsitek';
  static const designTypePrototypeSubtitle =
      'Desain prototype untuk tipe rumah <36m2';

  static const prototypeDesignsTitle = 'Desain Prorotype';
  static const prototypeDesignsCta = 'Download Dokumen';

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
  static const homeFeatureDesignConsultation = 'Perencanaan Desain';
  static const homeFeatureLicensingFacilities = 'Fasilitas Perizinan';
  static const homeFeatureConstructionLabor = 'Fasilitasi Tenaga Konstruksi';
  static const homeFeatureStoreMaterial = 'Fasilitasi Toko & Material';
  static const homeFeatureFinancingFacilities = 'Fasilitasi Pembiayaan';
  static const homeFeatureConstructionSupervision = 'Pengawasan Konstruksi';
  static const homeWelcomeTitle = 'Selamat Datang!';

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
  static const locationPermissionTitle = 'Izinkan Akses Lokasi';
  static const locationPermissionDescription =
      'Kami memerlukan akses lokasi untuk menampilkan detail lokasi proyek Anda.';
  static const locationPermissionSettingsTitle = 'Aktifkan Izin Lokasi';
  static const locationPermissionSettingsDescription =
      'Anda menolak izin lokasi sebelumnya. Buka pengaturan untuk mengaktifkannya agar dapat melanjutkan.';
  static const allowPermission = 'Izinkan';
  static const searchLocation = 'Cari Lokasi';
  static const searchLocationHint = 'Masukkan alamat atau nama tempat';
  static const permissionDenied = 'Tolak';
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
  static const profilePlaceholderName = '<User Name>';
  static const profilePlaceholderEmail = '<user email>';
  static const accountInformation = 'Informasi Akun';
  static const verifyProfile = 'Verifikasi Profil';
  static const verificationPending = 'Belum Diverifikasi';
  static const verificationCompleted = 'Terverifikasi';
  static const emailLabel = 'Email';
  static const otherActions = 'Lainnya';
  static const logout = 'Keluar';

  // Consultant list
  static const consultantSortLabel = 'Urutkan berdasarkan';
  static const createConsultationCta = 'Buat Konsultasi';
  static const recommendationTitle = 'Rekomendasi Konsultan';

  // Consultation
  static const consultationConfirmTitle = 'Konfirmasi Konsultasi';
  static const consultationOwnerLabel = 'Pemilik Proyek';
  static const consultationLocationLabel = 'Lokasi Proyek';
  static const consultationDetailLabel = 'Detail Konsultasi';
  static const consultationNoteTitle = 'CATATAN';
  static const consultationNoteBody =
      'Dengan menerima konsultasi ini, Anda setuju untuk melakukan survey lokasi (opsional) dan menyediakan proposal konsultasi dalam waktu 3-5 hari kerja.';
  static const consultationSurveyQuestion = 'Apakah memerlukan survey lokasi?';
  static const consultationSurveyNo = 'Tidak perlu survey';
  static const consultationSurveyYes = 'Perlu survey';
  static const consultationReject = 'Tolak Konsultasi';
  static const consultationAccept = 'Terima Konsultasi';
  static const consultationDownloadTitle = 'Unduh Dokumen';
  static const consultationMaxRevisionTitle = 'Maksimal revisi';
  static const consultationMaxRevisionBody =
      'Anda sudah mencapai batas revisi (3x).';
}
