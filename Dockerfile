# Docker file for ML + notebook (local runtime for Google Colab)

# https://www.tensorflow.org/install/source#gpu
# FROM tensorflow/tensorflow:2.3.2-gpu-jupyter
FROM tensorflow/tensorflow:2.13.0-gpu-jupyter

RUN mkdir src
WORKDIR src/
COPY . .

RUN pip3 install -r requirements.txt

RUN jupyter serverextension enable --py jupyter_http_over_ws

WORKDIR /src

#'*'
CMD [ "jupyter", "notebook","--ip=0.0.0.0","--no-browser","--NotebookApp.allow_remote_access=True","--allow-root",\
        "--NotebookApp.allow_origin='https://colab.research.google.com'", \
        "--port=8888", "--NotebookApp.port_retries=0"]

