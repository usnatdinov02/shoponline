# online shop

Professional e-commerce sayt Mercedes-Benz avtomobillari uchun.

## ✨ Asosiy Funksiyalar

### 🛍️ E-commerce
- Mahsulotlar boshqaruvi (bir nechta rasm)
- Savatcha va Wishlist
- Buyurtma tizimi
- To'liq profil (13 ta viloyat)

### 🌍 Ko'p tillilik
- 3 til: O'zbek, Rus, Ingliz
- Barcha UI elementlar tarjima qilinadi

### 📧 Email
- Gmail integratsiyasi
- Email tasdiqlash
- Buyurtma xabarlari

### 🎨 Zamonaviy Dizayn
- Responsive (mobil va desktop)
- Dark mode
- Animatsiyalar
- Toast notifications

### 🔒 Xavfsizlik
- CSRF himoya
- XSS prevention
- Session security
- Email verification

## 🚀 O'rnatish

### Local Development

```bash
# Virtual environment
python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac

# Dependencies
pip install -r requirements.txt

# Database
python manage.py migrate

# Superuser
python manage.py createsuperuser

# Run
python manage.py runserver
```

### 🌐 PythonAnywhere ga Deploy qilish

Batafsil qo'llanma uchun [PYTHONANYWHERE_DEPLOY.md](PYTHONANYWHERE_DEPLOY.md) faylini o'qing.

**Qisqacha:**
1. PythonAnywhere ga loyihani yuklang
2. Virtual environment yarating va requirements o'rnating
3. `pythonanywhere_wsgi.py` faylidagi kodni WSGI configuration ga ko'chiring
4. Static/Media yo'llarini sozlang
5. Database migratsiyalarini bajaring
6. Web app ni reload qiling

```bash
# Deploy buyruqlari (PythonAnywhere Bash Console da)
bash deploy_commands.sh
```

## 📧 Gmail Sozlash

1. Google Account > Security
2. 2-Step Verification yoqing
3. App Password yarating
4. settings.py da qo'ying

## 🎯 Texnologiyalar

- Django 5.2.7
- Bootstrap 5.3
- SQLite/PostgreSQL
- Gmail SMTP
- Vanilla JavaScript

## 📱 Sahifalar

- Bosh sahifa
- Mahsulotlar
- Savat
- Profil
- Sozlamalar
- Admin panel

---

**Ishlab chiqildi:** Cascade AI yordamida ❤️
# online-dokon
# onlineshop
