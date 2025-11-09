# ✅ Railway Deploy Checklist

## 📦 Tayyorgarlik (Local)

- [ ] **Procfile** mavjud va to'g'ri
  ```
  web: gunicorn setting.wsgi --log-file -
  ```

- [ ] **runtime.txt** yaratilgan
  ```
  python-3.10.12
  ```

- [ ] **railway.json** yaratilgan (ixtiyoriy)

- [ ] **requirements.txt** yangilangan
  - [ ] gunicorn
  - [ ] whitenoise
  - [ ] psycopg2-binary
  - [ ] python-decouple
  - [ ] Pillow

- [ ] **settings.py** Railway uchun sozlangan
  - [ ] `python-decouple` ishlatiladi
  - [ ] `ALLOWED_HOSTS` dynamic
  - [ ] PostgreSQL database config
  - [ ] WhiteNoise middleware qo'shilgan
  - [ ] Security settings production uchun

- [ ] GitHub ga push qilindi
  ```bash
  git add .
  git commit -m "Railway deploy ready"
  git push origin main
  ```

---

## 🚂 Railway Setup

- [ ] **Railway account** yaratildi
  - [ ] https://railway.app ga kirildi
  - [ ] GitHub bilan login qilindi
  - [ ] GitHub authorize qilindi

- [ ] **Project yaratildi**
  - [ ] "New Project" bosildi
  - [ ] "Deploy from GitHub repo" tanlandi
  - [ ] Repository tanlandi
  - [ ] Deploy boshlandi

- [ ] **PostgreSQL qo'shildi**
  - [ ] "New" > "Database" > "PostgreSQL"
  - [ ] Database yaratildi
  - [ ] Environment variables avtomatik qo'shildi

- [ ] **Environment Variables sozlandi**
  - [ ] `SECRET_KEY` (yangi generate qilingan)
  - [ ] `DEBUG=False`
  - [ ] `ALLOWED_HOSTS=*.railway.app`
  - [ ] `PYTHONUNBUFFERED=1`
  - [ ] PostgreSQL variables (avtomatik)

- [ ] **Deploy Settings**
  - [ ] Start command to'g'ri
  - [ ] Build command (ixtiyoriy)

---

## 🧪 Test va Launch

- [ ] **Deploy muvaffaqiyatli tugadi**
  - [ ] Deployments tabida "Success" ko'rsatildi
  - [ ] Logs da xato yo'q

- [ ] **Domain olindi**
  - [ ] Settings > Domains
  - [ ] Public URL nusxalandi

- [ ] **Sayt ishlayapti**
  - [ ] URL brauzerda ochildi
  - [ ] Home page yuklanadi
  - [ ] Static files ishlayapti
  - [ ] Admin panel ochiladi

- [ ] **Superuser yaratildi**
  ```bash
  railway run python manage.py createsuperuser
  ```

- [ ] **Admin panel test qilindi**
  - [ ] Login qilindi
  - [ ] Ma'lumotlar ko'rinadi

---

## 🔒 Security (Production)

- [ ] `DEBUG = False`
- [ ] `SECRET_KEY` yangi va xavfsiz
- [ ] `ALLOWED_HOSTS` to'g'ri sozlangan
- [ ] SSL/HTTPS yoqilgan
- [ ] Secure cookies yoqilgan
- [ ] `.env` fayllar gitignore da

---

## 📊 Monitoring

- [ ] **Logs tekshirildi**
  - [ ] Deployments > View Logs
  - [ ] Xatolar yo'q

- [ ] **Metrics ko'rildi**
  - [ ] CPU usage
  - [ ] Memory usage
  - [ ] Request count

---

## 🎯 Keyingi Qadamlar

- [ ] Custom domain qo'shish (ixtiyoriy)
- [ ] Email SMTP sozlash
- [ ] Backup strategiyasi
- [ ] Monitoring setup (Sentry, etc.)
- [ ] CI/CD pipeline

---

## 📝 Eslatmalar

**Deploy vaqti:** ~10-15 daqiqa  
**Narx:** $5/month free credit  
**Database:** PostgreSQL (Railway)  
**Server:** Gunicorn  
**Static files:** WhiteNoise  

---

## ✅ Deploy Tayyor!

Barcha checkboxlar belgilangandan keyin sizning Django loyihangiz Railway da ishga tushadi! 🎉

**Saytingiz:** `https://your-project.railway.app`

---

## 🆘 Yordam Kerakmi?

- 📖 To'liq qo'llanma: `RAILWAY_DEPLOY.md`
- 🚀 Tezkor boshlash: `RAILWAY_QUICKSTART.md`
- 🌐 Railway Docs: https://docs.railway.app
- 💬 Railway Discord: https://discord.gg/railway
