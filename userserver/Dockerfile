FROM python:3.6
COPY src /src/
WORKDIR /src
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "/src/userserver.py"]