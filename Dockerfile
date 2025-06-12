FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app/
RUN python manage.py collectstatic --noinput && \
    python manage.py migrate && \
    python manage.py createsuperuser --noinput || true

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "tabbycat.wsgi:application"]

