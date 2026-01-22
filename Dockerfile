FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN pip install mediaflow-proxy
EXPOSE 8888
RUN pip install uvicorn
#CMD ["mediaflow-proxy"]
#RUN uv run uvicorn mediaflow_proxy.main:app --host 0.0.0.0 --port 8888 --workers 4 --forwarded-allow-ips "*"
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "8888", "--workers", "4"]

