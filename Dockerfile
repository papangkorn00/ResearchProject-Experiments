# Use official Jupyter Data Science image (includes pandas, numpy, scikit-learn)
FROM jupyter/scipy-notebook:python-3.11

# Set working directory
WORKDIR /home/jovyan/work

# Copy requirements file
COPY requirements.txt .

# Install additional dependencies + Colab support
RUN pip install --no-cache-dir scikit-surprise jupyter_http_over_ws && \
    jupyter serverextension enable --py jupyter_http_over_ws

# Copy project files
COPY . .

# Expose Jupyter port
EXPOSE 8888

# Default command (inherited from base image - starts Jupyter Lab)
