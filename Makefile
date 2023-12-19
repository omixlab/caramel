MAKEFLAGS=-j 2
CONDA_EXE=conda
CARAMEL_PORT=8080

setup:
	@$(CONDA_EXE) env create || $(CONDA_EXE) env update

download_data:
	@wget -O data.tar.gz https://zenodo.org/records/10406050/files/data.tar.gz?download=1
	@tar -xvf data.tar.gz

server:
	@bambu-server \
		--host 0.0.0.0 \
		--port $(CARAMEL_PORT) \
		--config configuration.json

worker:
	@bambu-worker

deploy: server worker
