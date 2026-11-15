# Mini Katalog Uygulaması (Mini Catalog App)

Bu proje, Flutter günlük eğitim programı kapsamında geliştirilmiş temel seviyede bir mobil katalog uygulamasıdır. Widget ağacı, sayfa geçişleri (Navigator), temel UI tasarımı, veri modelleme ve proje klasörleme mantığını pekiştirmek amacıyla oluşturulmuştur.

## 🚀 Özellikler

* **Ana Sayfa (Discover):** Banner alanı, ürün arama çubuğu ve `GridView` ile 2 sütunlu kart yapısında ürün listeleme.
* **Ürün Detay Ekranı:** Seçilen ürünün görseli, fiyatı, açıklaması ve sepete ekleme özelliği.
* **Sepet Sistemi (Simülasyon):** Eklenen ürünleri listeleme, sepetten ürün çıkarma ve sipariş tamamlama (Checkout) akışı.
* **Sayfa Geçişleri:** `Navigator.push` ve `Navigator.pop` ile sayfalar arası veri taşıma.

## 🛠️ Kullanılan Teknolojiler ve Sürüm

* **Flutter Sürümü:** 3.24.0 (veya güncel kararlı sürüm)
* **Dart Sürümü:** 3.5.0
* **Kullanılan Paketler:** Ekstra bir dış paket kullanılmamıştır; yalnızca Flutter'ın varsayılan `material.dart` kütüphanesi kullanılmıştır.

## 📂 Proje Klasör Yapısı

```text
lib/
├── models/
│   └── product.dart        # Ürün veri modeli ve simülasyon verileri
├── screens/
│   ├── home_screen.dart    # Ana sayfa ve ürün listesi
│   ├── detail_screen.dart  # Ürün detay sayfası
│   └── cart_screen.dart    # Sepet ekranı
└── main.dart               # Uygulama başlangıç noktası
```

## ⚙️ Kurulum ve Çalıştırma Adımları

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

1. **Projeyi bilgisayarınıza klonlayın:**
   ```bash
   git clone https://github.com/kullanici-adiniz/mini-catalog-app.git
   cd mini-catalog-app
   ```

2. **Gerekli bağımlılıkları kontrol edin:**
   ```bash
   flutter pub get
   ```

3. **Uygulamayı çalıştırın:**
   Bir Android/iOS emülatörü başlatın veya fiziksel cihazınızı bağlayın, ardından şu komutu çalıştırın:
   ```bash
   flutter run
   ```