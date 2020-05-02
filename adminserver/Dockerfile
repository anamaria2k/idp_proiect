FROM python:3.6
COPY src /src/
WORKDIR /src
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python", "/src/adminserver.py"]