# 🚂 Railway Deploy - To'liq Qo'llanma

**GitHub:** https://github.com/usnatdinov02/online-dokon  
**Railway:** https://railway.app

---

## 📋 DEPLOY QADAMLARI

### 1️⃣ Railway Account Yaratish

1. **Railway.app** ga kiring: https://railway.app
2. **Login with GitHub** tugmasini bosing
3. GitHub akkauntingiz bilan kirish
4. Railway sizning GitHub repolaringizga kirish so'raydi - **Authorize** qiling

---

### 2️⃣ Loyihani Tayyorlash

Railway uchun loyihangizda quyidagi fayllar bo'lishi kerak:

#### ✅ `requirements.txt` - Mavjud
```txt
Django==5.2.7
gunicorn
whitenoise
psycopg2-binary
python-decouple
Pillow
```

#### ✅ `Procfile` - Yangilash kerak
```
web: gunicorn setting.wsgi --log-file -
```

#### ✅ `runtime.txt` - Yaratish kerak
```
python-3.10.12
```

#### ✅ `railway.json` - Yaratish kerak (ixtiyoriy)
```json
{
  "$schema": "https://railway.app/railway.schema.json",
  "build": {
    "builder": "NIXPACKS"
  },
  "deploy": {
    "startCommand": "python manage.py migrate && python manage.py collectstatic --noinput && gunicorn setting.wsgi",
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
```

---

### 3️⃣ Settings.py ni Yangilash

Railway uchun `setting/settings.py` faylini quyidagicha o'zgartiring:

```python
import os
from decouple import config, Csv

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = config('SECRET_KEY', default='django-insecure-test-key-for-development-only')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DEBUG', default=False, cast=bool)

# Railway uchun ALLOWED_HOSTS
ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='localhost,127.0.0.1', cast=Csv())

# Database - Railway PostgreSQL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config('PGDATABASE', default='railway'),
        'USER': config('PGUSER', default='postgres'),
        'PASSWORD': config('PGPASSWORD', default=''),
        'HOST': config('PGHOST', default='localhost'),
        'PORT': config('PGPORT', default='5432'),
    }
}

# Static files - WhiteNoise bilan
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # Bu qatorni qo'shing
    # ... qolgan middleware'lar
]

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Media files
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Security Settings (Production)
if not DEBUG:
    SECURE_SSL_REDIRECT = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SECURE = True
    SECURE_BROWSER_XSS_FILTER = True
    SECURE_CONTENT_TYPE_NOSNIFF = True
    X_FRAME_OPTIONS = 'DENY'
```

---

### 4️⃣ Railway Project Yaratish

1. **Railway Dashboard** ga kiring: https://railway.app/dashboard
2. **New Project** tugmasini bosing
3. **Deploy from GitHub repo** ni tanlang
4. **usnatdinov02/online-dokon** reponi tanlang
5. Railway avtomatik deploy qila boshlaydi

---

### 5️⃣ PostgreSQL Database Qo'shish

1. Railway project ichida **New** tugmasini bosing
2. **Database** > **Add PostgreSQL** ni tanlang
3. PostgreSQL avtomatik yaratiladi va environment variables qo'shiladi

---

### 6️⃣ Environment Variables Sozlash

Railway project ichida **Variables** tabiga o'ting va quyidagilarni qo'shing:

```env
# Django Settings
SECRET_KEY=your-super-secret-key-here-generate-new-one
DEBUG=False
ALLOWED_HOSTS=*.railway.app,yourdomain.com

# PostgreSQL (Railway avtomatik qo'shadi, lekin tekshiring)
PGDATABASE=railway
PGUSER=postgres
PGPASSWORD=***
PGHOST=***.railway.app
PGPORT=5432

# Python
PYTHONUNBUFFERED=1
```

**SECRET_KEY generatsiya qilish:**
```python
# Python console da ishga tushiring:
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
```

---

### 7️⃣ Deploy Settings

Railway project ichida **Settings** tabiga o'ting:

1. **Build Command** (ixtiyoriy):
   ```bash
   pip install -r requirements.txt
   ```

2. **Start Command**:
   ```bash
   python manage.py migrate && python manage.py collectstatic --noinput && gunicorn setting.wsgi
   ```

3. **Watch Paths** (ixtiyoriy):
   ```
   **/*.py
   requirements.txt
   ```

---

### 8️⃣ Deploy va Test

1. Railway avtomatik deploy qiladi
2. **Deployments** tabida jarayonni kuzating
3. Deploy tugagach, **View Logs** dan xatolarni tekshiring
4. **Settings** > **Domains** dan public URL ni oling
5. Saytingizni brauzerda oching!

---

## 🔧 Kerakli Fayllarni Yaratish/Yangilash

### `Procfile` ni yangilash:
```
web: gunicorn setting.wsgi --log-file -
```

### `runtime.txt` yaratish:
```
python-3.10.12
```

### `requirements.txt` ga qo'shimchalar:
```txt
Django==5.2.7
gunicorn==21.2.0
whitenoise==6.6.0
psycopg2-binary==2.9.9
python-decouple==3.8
Pillow==10.1.0
```

---

## 🎯 Superuser Yaratish

Railway da superuser yaratish uchun:

1. Railway project > **Settings** > **Service**
2. **Connect to Service** tugmasini bosing yoki CLI dan:

```bash
# Railway CLI o'rnatish
npm i -g @railway/cli

# Login qilish
railway login

# Project ga ulanish
railway link

# Shell ochish
railway run python manage.py createsuperuser
```

---

## 🔄 Yangilanishlarni Deploy Qilish

Railway GitHub bilan bog'langan, shuning uchun:

```bash
# Local da o'zgarishlar qiling
git add .
git commit -m "Update: yangi funksiya qo'shildi"
git push origin main
```

Railway avtomatik yangi deploy qiladi! 🎉

---

## ❌ Xatolar va Yechimlar

### 1. ModuleNotFoundError: No module named 'decouple'
```bash
# requirements.txt ga qo'shing:
python-decouple==3.8
```

### 2. Database connection error
- Railway PostgreSQL environment variables to'g'ri sozlanganligini tekshiring
- `PGHOST`, `PGPORT`, `PGUSER`, `PGPASSWORD`, `PGDATABASE` mavjudligini tekshiring

### 3. Static files yuklanmayapti
```python
# settings.py da:
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'
```

### 4. DisallowedHost error
```python
# settings.py da:
ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='*.railway.app', cast=Csv())
```

### 5. Application failed to respond
- Start command to'g'ri ekanligini tekshiring
- Logs da xatolarni o'qing
- `gunicorn setting.wsgi` to'g'ri ishlayotganini tekshiring

---

## 📊 Railway CLI Commands

```bash
# Railway CLI o'rnatish
npm i -g @railway/cli

# Login
railway login

# Project yaratish
railway init

# Link qilish
railway link

# Environment variables ko'rish
railway variables

# Logs ko'rish
railway logs

# Shell ochish
railway run bash

# Deploy qilish
railway up
```

---

## 🌐 Custom Domain Qo'shish

1. Railway project > **Settings** > **Domains**
2. **Custom Domain** tugmasini bosing
3. Domeningizni kiriting (masalan: `myshop.com`)
4. Railway sizga DNS settings beradi
5. Domain provideringizda CNAME record qo'shing:
   ```
   Type: CNAME
   Name: www (yoki @)
   Value: your-project.railway.app
   ```

---

## 💰 Narxlar

Railway **$5/month** credit beradi (Free tier):
- 500 soat runtime/month
- 100 GB egress
- Shared CPU va RAM

Agar ko'proq kerak bo'lsa, **Developer Plan** $20/month

---

## 📝 Muhim Eslatmalar

- ✅ Railway PostgreSQL ishlatadi (SQLite emas!)
- ✅ WhiteNoise static fayllar uchun
- ✅ Gunicorn production server
- ✅ GitHub bilan avtomatik deploy
- ⚠️ Production da `DEBUG = False`
- 🔒 `SECRET_KEY` ni yangi generate qiling
- 🔒 Environment variables da maxfiy ma'lumotlarni saqlang

---

## 🔍 Foydali Linklar

- **Railway Docs:** https://docs.railway.app
- **Railway Dashboard:** https://railway.app/dashboard
- **Railway CLI:** https://docs.railway.app/develop/cli
- **Django on Railway:** https://docs.railway.app/guides/django

---

## 🎬 Qisqa Xulosa

1. ✅ Railway akkaunt yarating (GitHub bilan)
2. ✅ Loyihani tayyorlang (`Procfile`, `runtime.txt`, `requirements.txt`)
3. ✅ `settings.py` ni Railway uchun sozlang
4. ✅ Railway da GitHub repo dan deploy qiling
5. ✅ PostgreSQL database qo'shing
6. ✅ Environment variables sozlang
7. ✅ Deploy va test qiling!

---

✅ **Tayyor! Saytingiz Railway da ishga tushadi!** 🚂🎉
