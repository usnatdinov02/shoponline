# 🚀 Railway Deploy - Tezkor Boshlash

## 1️⃣ Fayllarni Tayyorlash (5 daqiqa)

### Kerakli fayllar yaratildi:
- ✅ `Procfile` - yangilandi
- ✅ `runtime.txt` - yaratildi
- ✅ `railway.json` - yaratildi
- ✅ `requirements.railway.txt` - yaratildi
- ✅ `.env.railway` - template yaratildi

### Qilish kerak:

1. **requirements.txt ni yangilang:**
```bash
# Eski requirements.txt ni backup qiling
copy requirements.txt requirements.old.txt

# Railway requirements ni asosiy qiling
copy requirements.railway.txt requirements.txt
```

2. **GitHub ga push qiling:**
```bash
git add .
git commit -m "Railway deploy uchun tayyorlandi"
git push origin main
```

---

## 2️⃣ Railway da Deploy (10 daqiqa)

### A. Railway Account
1. https://railway.app ga kiring
2. **Login with GitHub** bosing
3. GitHub bilan kirish va authorize qiling

### B. Project Yaratish
1. **New Project** tugmasini bosing
2. **Deploy from GitHub repo** ni tanlang
3. **usnatdinov02/online-dokon** ni tanlang
4. Railway avtomatik deploy boshlaydi

### C. PostgreSQL Qo'shish
1. Project ichida **New** tugmasini bosing
2. **Database** > **Add PostgreSQL** ni tanlang
3. PostgreSQL avtomatik yaratiladi

### D. Environment Variables
**Variables** tabiga o'ting va qo'shing:

```env
SECRET_KEY=django-insecure-o'zingizni-generate-qiling
DEBUG=False
ALLOWED_HOSTS=*.railway.app
PYTHONUNBUFFERED=1
```

**SECRET_KEY generate qilish:**
```bash
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

### E. Deploy Settings
**Settings** > **Deploy** ga o'ting:

**Start Command:**
```bash
python manage.py migrate && python manage.py collectstatic --noinput && gunicorn setting.wsgi
```

---

## 3️⃣ Test va Launch (2 daqiqa)

1. **Deployments** tabida deploy jarayonini kuzating
2. Deploy tugagach **View Logs** dan tekshiring
3. **Settings** > **Domains** dan public URL ni oling
4. Brauzerda ochib test qiling! 🎉

---

## 🎯 Superuser Yaratish

Railway CLI orqali:

```bash
# Railway CLI o'rnatish
npm i -g @railway/cli

# Login
railway login

# Project ga ulanish
railway link

# Superuser yaratish
railway run python manage.py createsuperuser
```

---

## 🔄 Keyingi Deploy'lar

Juda oson! Faqat GitHub ga push qiling:

```bash
git add .
git commit -m "Yangi o'zgarishlar"
git push origin main
```

Railway avtomatik deploy qiladi! ✨

---

## ❓ Muammo Bo'lsa?

### Deploy muvaffaqiyatsiz bo'ldi?
1. **Logs** ni o'qing (Deployments > View Logs)
2. Environment variables to'g'ri ekanligini tekshiring
3. PostgreSQL ulanganligini tekshiring

### Static fayllar yuklanmayapti?
```bash
# Railway shell da:
railway run python manage.py collectstatic --noinput
```

### Database xatosi?
- PostgreSQL service ishlab turganligini tekshiring
- Environment variables (PGHOST, PGPORT, etc.) mavjudligini tekshiring

---

## 📞 Yordam

To'liq qo'llanma: `RAILWAY_DEPLOY.md` faylini o'qing

Railway Docs: https://docs.railway.app

---

✅ **Hammasi tayyor! Railway ga deploy qilishingiz mumkin!** 🚂
