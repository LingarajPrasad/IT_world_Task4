FROM python:3.9-alpine
WORKDIR /app
COPY . /app
RUN pip install --upgrade -r requirements.txt
EXPOSE 7000
CMD ["python", "main.py"]
