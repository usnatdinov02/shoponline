# 🚂 Railway Deploy - Boshlanish

## 👋 Salom!

Sizning Django loyihangiz Railway ga deploy qilish uchun tayyor!

---

## 📚 Qaysi Faylni O'qish Kerak?

### 🇺🇿 O'zbek tilida:
**`RAILWAY_UZBEK.md`** - Avval buni o'qing! Umumiy ma'lumot.

### 🚀 Tezkor boshlash:
**`RAILWAY_QUICKSTART.md`** - 15 daqiqada deploy qiling!

### 📖 To'liq qo'llanma:
**`RAILWAY_DEPLOY.md`** - Batafsil ma'lumot va yechimlar.

### ✅ Checklist:
**`RAILWAY_CHECKLIST.md`** - Hech narsani unutmang!

---

## ⚡ Eng Tez Yo'l (15 daqiqa)

### 1. Requirements ni yangilang:
```bash
copy requirements.railway.txt requirements.txt
```

### 2. GitHub ga push qiling:
```bash
git add .
git commit -m "Railway deploy ready"
git push origin main
```

### 3. Railway ga kiring:
- https://railway.app
- Login with GitHub
- New Project > Deploy from GitHub repo
- Repository ni tanlang

### 4. PostgreSQL qo'shing:
- New > Database > PostgreSQL

### 5. Environment Variables:
```env
SECRET_KEY=yangi-key-generate-qiling
DEBUG=False
ALLOWED_HOSTS=*.railway.app
```

### 6. Deploy!
Railway avtomatik deploy qiladi. Tayyor! 🎉

---

## 📂 Yaratilgan Fayllar

| Fayl | Maqsad |
|------|--------|
| `RAILWAY_UZBEK.md` | O'zbek tilida umumiy ma'lumot |
| `RAILWAY_QUICKSTART.md` | Tezkor boshlash qo'llanmasi |
| `RAILWAY_DEPLOY.md` | To'liq deploy qo'llanmasi |
| `RAILWAY_CHECKLIST.md` | Deploy checklist |
| `Procfile` | Railway server config (yangilandi) |
| `runtime.txt` | Python versiyasi |
| `railway.json` | Railway konfiguratsiya |
| `requirements.railway.txt` | Railway paketlar |
| `.env.railway` | Environment variables template |
| `setting/settings_railway.py` | Railway Django settings |

---

## 🎯 Keyingi Qadam

1. **`RAILWAY_UZBEK.md`** ni oching - Umumiy ma'lumot
2. **`RAILWAY_QUICKSTART.md`** ni bajaring - Deploy qiling
3. **Saytingiz ishga tushadi!** 🚀

---

## 💡 Muhim Eslatmalar

- ✅ Barcha kerakli fayllar yaratildi
- ✅ Procfile to'g'rilandi
- ✅ Requirements tayyor
- ✅ Settings Railway uchun sozlandi
- ⚠️ `requirements.txt` ni yangilashni unutmang!
- ⚠️ `SECRET_KEY` ni yangi generate qiling!

---

## 🆘 Yordam Kerakmi?

1. **`RAILWAY_UZBEK.md`** - Umumiy ma'lumot va maslahatlar
2. **`RAILWAY_DEPLOY.md`** - Batafsil qo'llanma va xatolar yechimi
3. **Railway Docs** - https://docs.railway.app

---

## ✅ Tayyor!

Hammasi tayyor! Faqat `RAILWAY_QUICKSTART.md` ni bajaring va saytingiz ishga tushadi!

**Omad!** 🍀🚂

---

**P.S.** Railway juda oson! 15 daqiqada deploy qilasiz! 💪
