# Use slim base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies for popular Python libs
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip first
RUN pip install --no-cache-dir --upgrade pip

# Install Python packages
RUN pip install --no-cache-dir \
    pandas numpy matplotlib seaborn scikit-learn jupyter \
    transformers torch datasets huggingface_hub \
    flask fastapi uvicorn requests beautifulsoup4 \
    plotly streamlit gradio

# Expose default Jupyter port
EXPOSE 8888

# Default command: launch Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
