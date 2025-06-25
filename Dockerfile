# Gunakan base image python
FROM python:3.9-slim
# Set direktori kerja di dalam container
WORKDIR /app
# Salin file requirements dan install dependensi
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# Salin sisa kode aplikasi
COPY . .
# Perintah untuk menjalankan aplikasi saat container dimulai
# Cloud Run akan otomatis menyediakan variabel $PORT
CMD ["gunicorn", "--bind", "0.0.0.0:8080","main:app"]
