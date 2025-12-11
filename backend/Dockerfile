# Temiz, hafif ve güvenli bir temel imaj
FROM python:3.12-slim

# Çalışma dizini
WORKDIR /app

# Python optimizasyonları
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Kütüphaneleri yükle (Sadece requirements.txt kopyalanıp yükleniyor)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kalan tüm kodu kopyala
COPY . .

# Django'nun varsayılan portu
EXPOSE 8000

# Container çalıştığında çalışacak komut (0.0.0.0, Docker'a dışarıya açılmasını söyler)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]