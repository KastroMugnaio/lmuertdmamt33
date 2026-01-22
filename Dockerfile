FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/mhdzumair/mediaflow-proxy.git 
RUN cd mediaflow-proxy
RUN pip install uv
RUN uv sync
EXPOSE 8888
RUN uv run uvicorn mediaflow_proxy.main:app --host 0.0.0.0 --port 8888 --workers 4 --forwarded-allow-ips "*"
#CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "8888", "--workers", "4"]

