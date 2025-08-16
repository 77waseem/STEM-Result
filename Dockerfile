# استخدم صورة بايثون رسمية خفيفة
FROM python:3.11-slim

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# تحديث نظام التشغيل وتثبيت أدوات البناء المطلوبة
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    python3-dev \
    libffi-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# نسخ كل ملفات المشروع للحاوية
COPY . /app

# إنشاء virtual environment وتفعيله
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# تحديث pip و setuptools و wheel
RUN pip install --upgrade pip setuptools wheel

# تثبيت متطلبات المشروع
RUN pip install -r requirements.txt

# تحديد المنفذ اللي هيشتغل عليه التطبيق
EXPOSE 5000

# أمر تشغيل التطبيق
CMD ["python", "app.py"]
