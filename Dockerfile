# استخدم صورة بايثون رسمية
FROM python:3.11-slim

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ كل ملفات المشروع للحاوية
COPY . /app

# إنشاء virtual environment وتفعيله
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# تحديث pip وتثبيت المتطلبات
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# تحديد المنفذ اللي هيشتغل عليه التطبيق
EXPOSE 5000

# أمر تشغيل
